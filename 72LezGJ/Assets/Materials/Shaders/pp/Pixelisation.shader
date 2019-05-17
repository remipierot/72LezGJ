// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32900,y:33253,varname:node_2865,prsc:2|emission-4676-OUT;n:type:ShaderForge.SFN_TexCoord,id:4219,x:31792,y:33229,cmnt:Default coordinates,varname:node_4219,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Relay,id:4676,x:32597,y:33354,cmnt:Modify color here,varname:node_4676,prsc:2|IN-7542-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:4430,x:31792,y:33416,ptovrint:False,ptlb:MainTex,ptin:_MainTex,cmnt:MainTex contains the color of the scene,varname:node_9933,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7542,x:32361,y:33354,varname:node_1672,prsc:2,ntxv:0,isnm:False|UVIN-2348-OUT,TEX-4430-TEX;n:type:ShaderForge.SFN_ValueProperty,id:3884,x:31623,y:33048,ptovrint:False,ptlb:ResX,ptin:_ResX,varname:node_3884,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:32;n:type:ShaderForge.SFN_ValueProperty,id:2734,x:31623,y:33134,ptovrint:False,ptlb:ResY,ptin:_ResY,varname:node_2734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:32;n:type:ShaderForge.SFN_Append,id:8579,x:31792,y:33048,varname:node_8579,prsc:2|A-3884-OUT,B-2734-OUT;n:type:ShaderForge.SFN_Divide,id:5242,x:31957,y:32961,varname:node_5242,prsc:2|A-7661-OUT,B-8579-OUT;n:type:ShaderForge.SFN_Vector1,id:7661,x:31792,y:32993,varname:node_7661,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:8564,x:31957,y:33117,varname:node_8564,prsc:2|A-8579-OUT,B-4219-UVOUT;n:type:ShaderForge.SFN_Floor,id:3642,x:32132,y:33117,varname:node_3642,prsc:2|IN-8564-OUT;n:type:ShaderForge.SFN_Multiply,id:1990,x:32304,y:33045,varname:node_1990,prsc:2|A-5242-OUT,B-3642-OUT;n:type:ShaderForge.SFN_Add,id:2348,x:32304,y:32895,varname:node_2348,prsc:2|A-5242-OUT,B-1990-OUT;proporder:4430-3884-2734;pass:END;sub:END;*/

Shader "Shader Forge/Pixelisation" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _ResX ("ResX", Float ) = 32
        _ResY ("ResY", Float ) = 32
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _ResX;
            uniform float _ResY;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_8579 = float2(_ResX,_ResY);
                float2 node_5242 = (1.0/node_8579);
                float2 node_2348 = (node_5242+(node_5242*floor((node_8579*i.uv0))));
                float4 node_1672 = tex2D(_MainTex,TRANSFORM_TEX(node_2348, _MainTex));
                float3 emissive = node_1672.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
