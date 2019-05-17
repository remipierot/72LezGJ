Shader "Hidden/KuwaharaEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
        _KuwaharaRadius ("KuwaharaRadius", Range(1, 10)) = 1
        _SliderScreen ("SliderScreen", Range(0, 1)) = 0
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				float4 screenPos : TEXCOORD1;
			};

			float4 _MainTex_ST;
			float4 _MainTex_ST_TexelSize_;
			float step_x;
			float step_y;

			v2f vert (appdata_base v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.screenPos = ComputeScreenPos(o.vertex);
				return o;
			}
			
			sampler2D _MainTex;
			float4 _MainTex_TexelSize;
			float _KuwaharaRadius;
			float _SliderScreen;

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				step_x = _MainTex_TexelSize.x;
				step_y = _MainTex_TexelSize.y;

				_KuwaharaRadius = round(_KuwaharaRadius);

				float3 m1 = {0, 0, 0};
				float3 m2 = {0, 0, 0};
				float3 m3 = {0, 0, 0};
				float3 m4 = {0, 0, 0};

				float3 d1 = {0, 0, 0};
				float3 d2 = {0, 0, 0};
				float3 d3 = {0, 0, 0};
				float3 d4 = {0, 0, 0};

				for(int x = 0; x < _KuwaharaRadius; x++) {
					for(int y = 0; y < _KuwaharaRadius; y++) {

						m1 += tex2D(_MainTex, i.uv + float2(step_x 	* x, 	step_y * y));
						m2 += tex2D(_MainTex, i.uv + float2(step_x 	* -x, 	step_y * y));
						m3 += tex2D(_MainTex, i.uv + float2(step_x 	* -x, 	step_y * -y));
						m4 += tex2D(_MainTex, i.uv + float2(step_x 	* x, 	step_y * -y));

						d1 += pow(tex2D(_MainTex, i.uv + float2(step_x * x, 	step_y * y)), 2);
						d2 += pow(tex2D(_MainTex, i.uv + float2(step_x * -x, 	step_y * y)), 2);
						d3 += pow(tex2D(_MainTex, i.uv + float2(step_x * -x, 	step_y * -y)), 2);
						d4 += pow(tex2D(_MainTex, i.uv + float2(step_x * x, 	step_y * -y)), 2);

					}
				}


				float ratio = _KuwaharaRadius * _KuwaharaRadius;
				float3 stddev[4] = {d1, d2, d3, d4};
				float3 means[4] = {m1, m2, m3, m4};

				float valMin = 1;
				float curStdDev = 0;
				float4 c = tex2D(_MainTex, i.uv);

				for(int l = 0; l < 4; l++) {

					means[l] = means[l] / ratio; // Valeur moyenne
					stddev[l] = abs(stddev[l]/ratio - means[l] * means[l]); // Ecart type
					curStdDev = stddev[l].r + stddev[l].g + stddev[l].b;

					if(curStdDev < valMin) {
						valMin = curStdDev;
						c.rgb = means[l].rgb;
					}

				}

				if(i.uv.x > _SliderScreen) return float4(c.rgb, 1);
				else return col;
			}
			ENDCG
		}
	}
}

