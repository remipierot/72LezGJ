Shader "Hidden/Sepia"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
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
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                
				float outputRed = (col.r * .393) + (col.g *.769) + (col.b * .189);
				float outputGreen = (col.r * .349) + (col.g *.686) + (col.b * .168);
				float outputBlue = (col.r * .272) + (col.g *.534) + (col.b * .131);
				
				col.r = outputRed;
				col.g = outputGreen;
				col.b = outputBlue;

                return col;
            }
            ENDCG
        }
    }
}
