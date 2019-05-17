// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1797,x:33416,y:32882,varname:node_1797,prsc:2|diff-2072-OUT,alpha-2779-OUT;n:type:ShaderForge.SFN_Slider,id:2779,x:32909,y:33051,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_2779,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7997457,max:1;n:type:ShaderForge.SFN_Color,id:2089,x:32483,y:32337,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_2089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.5,c3:0.4779412,c4:1;n:type:ShaderForge.SFN_DepthBlend,id:3134,x:32482,y:32830,varname:node_3134,prsc:2|DIST-1237-OUT;n:type:ShaderForge.SFN_Slider,id:1237,x:31971,y:32803,ptovrint:False,ptlb:FoamSize,ptin:_FoamSize,varname:node_1237,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.02564103,max:1;n:type:ShaderForge.SFN_Tex2d,id:2412,x:32482,y:32630,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_2412,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1338fbcc2850fc743abe3fb00ebf714c,ntxv:3,isnm:False|UVIN-868-OUT;n:type:ShaderForge.SFN_OneMinus,id:9697,x:32734,y:32772,varname:node_9697,prsc:2|IN-3134-OUT;n:type:ShaderForge.SFN_Add,id:2336,x:32933,y:32695,varname:node_2336,prsc:2|A-1637-OUT,B-9697-OUT;n:type:ShaderForge.SFN_Add,id:1637,x:32707,y:32545,varname:node_1637,prsc:2|A-2089-RGB,B-2412-RGB,C-1624-OUT,D-5426-OUT;n:type:ShaderForge.SFN_Color,id:4095,x:32767,y:32942,ptovrint:False,ptlb:FoamTint,ptin:_FoamTint,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2072,x:32974,y:32883,varname:node_2072,prsc:2|A-2336-OUT,B-4095-RGB;n:type:ShaderForge.SFN_TexCoord,id:3815,x:30996,y:32504,varname:node_3815,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2448,x:31186,y:32588,varname:node_2448,prsc:2|A-3815-UVOUT,B-5734-TSL;n:type:ShaderForge.SFN_Time,id:5734,x:30995,y:32656,varname:node_5734,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:723,x:31378,y:32588,ptovrint:False,ptlb:DisplacementTexture,ptin:_DisplacementTexture,varname:node_723,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e08c295755c0885479ad19f518286ff2,ntxv:3,isnm:True|UVIN-2448-OUT;n:type:ShaderForge.SFN_Vector1,id:8758,x:31378,y:32504,varname:node_8758,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:9184,x:31566,y:32539,varname:node_9184,prsc:2|A-8758-OUT,B-723-R,C-723-G;n:type:ShaderForge.SFN_Subtract,id:5863,x:31742,y:32539,varname:node_5863,prsc:2|A-9184-OUT,B-9350-OUT;n:type:ShaderForge.SFN_Vector1,id:9350,x:31566,y:32663,varname:node_9350,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7783,x:31933,y:32432,varname:node_7783,prsc:2|A-8738-OUT,B-5863-OUT;n:type:ShaderForge.SFN_Slider,id:8738,x:31378,y:32430,ptovrint:False,ptlb:Magnitude,ptin:_Magnitude,varname:node_8738,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.09774778,max:1;n:type:ShaderForge.SFN_TexCoord,id:7192,x:31933,y:32585,varname:node_7192,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:868,x:32127,y:32516,varname:node_868,prsc:2|A-7783-OUT,B-7192-UVOUT;n:type:ShaderForge.SFN_Code,id:1274,x:31241,y:32925,varname:node_1274,prsc:2,code:ZgBsAG8AYQB0ADIAIABuACAAPQAgAGYAbABvAG8AcgAoAHgAKQA7AA0ACgAJAAkACQAJAGYAbABvAGEAdAAyACAAZgAgAD0AIABmAHIAYQBjACgAeAApADsADQAKAA0ACgAJAAkACQAJAGYAbABvAGEAdAAyACAAbQBnACwAIABtAHIALAAgAG0AbwA7AA0ACgANAAoACQAJAAkACQBmAGwAbwBhAHQAIABtAGQAIAA9ACAAOAAuADAAOwANAAoACQAJAAkACQBmAG8AcgAgACgAaQBuAHQAIABqACAAPQAgAC0AMQA7ACAAagAgADwAPQAgADEAOwAgAGoAKwArACkADQAKAAkACQAJAAkAewANAAoACQAJAAkACQAJAGYAbwByACAAKABpAG4AdAAgAGkAIAA9ACAALQAxADsAIABpACAAPAA9ACAAMQA7ACAAaQArACsAKQANAAoACQAJAAkACQAJAHsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAyACAAZwAgAD0AIABmAGwAbwBhAHQAMgAoAGYAbABvAGEAdAAoAGkAKQAsACAAZgBsAG8AYQB0ACgAagApACkAOwANAAoACQAJAAkACQAJAAkAZgBsAG8AYQB0ADIAIABvACAAPQAgAGYAcgBhAGMAKABzAGkAbgAoAGYAbABvAGEAdAAyACgAKABuACsAZwApAC4AeAAgACoAIAAoAG4AKwBnACkALgB5ACwAIAAoAG4AKwBnACkALgB4ACAAKwAgACgAbgArAGcAKQAuAHkAKQApACAAKgAgAGYAbABvAGEAdAAyACgAMgAzADQAMwA0ADIALgAxADQANQA5ADEAMgAzACwAIAAzADcAMwA0ADQANQAuADMANAA5ADAANAAyADMAKQApADsADQAKAAkACQAJAAkACQAJAG8AIAA9ACAAMAAuADUAIAArACAAMAAuADMAKgBzAGkAbgAoACAAXwBUAGkAbQBlAC4AeAAqADEAMAAgACsAIAA2AC4AMgA4ADMAMQAqAG8AIAApADsADQAKAA0ACgAJAAkACQAJAAkACQBmAGwAbwBhAHQAMgAgAHIAIAA9ACAAZwAgACsAIABvACAALQAgAGYAOwANAAoACQAJAAkACQAJAAkAZgBsAG8AYQB0ACAAZAAgAD0AIABkAG8AdAAoAHIALAAgAHIAKQA7AA0ACgANAAoACQAJAAkACQAJAAkAaQBmACAAKABkADwAbQBkACkADQAKAAkACQAJAAkACQAJAHsADQAKAAkACQAJAAkACQAJAAkAbQBkACAAPQAgAGQAOwANAAoACQAJAAkACQAJAAkACQBtAHIAIAA9ACAAcgA7AA0ACgAJAAkACQAJAAkACQAJAG0AZwAgAD0AIABnADsADQAKAAkACQAJAAkACQAJAAkAbQBvACAAPQAgAG8AOwANAAoACQAJAAkACQAJAAkAfQANAAoACQAJAAkACQAJAH0ADQAKAAkACQAJAAkAfQANAAoACQAJAAkACQANAAoACQAJAAkACQBtAGQAIAA9ACAAOAAuADAAOwANAAoACQAJAAkACQBmAG8AcgAgACgAaQBuAHQAIABqACAAPQAgAC0AMgA7ACAAagAgADwAPQAgADIAOwAgAGoAKwArACkADQAKAAkACQAJAAkAewANAAoACQAJAAkACQAJAGYAbwByACAAKABpAG4AdAAgAGkAIAA9ACAALQAyADsAIABpACAAPAA9ACAAMgA7ACAAaQArACsAKQANAAoACQAJAAkACQAJAHsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAyACAAZwAgAD0AIABtAGcAIAArACAAZgBsAG8AYQB0ADIAKABmAGwAbwBhAHQAKABpACkALAAgAGYAbABvAGEAdAAoAGoAKQApADsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAyACAAbwAgAD0AIABmAHIAYQBjACgAcwBpAG4AKABmAGwAbwBhAHQAMgAoACgAbgArAGcAKQAuAHgAIAAqACAAKABuACsAZwApAC4AeQAsACAAKABuACsAZwApAC4AeAAgACsAIAAoAG4AKwBnACkALgB5ACkAKQAgACoAIABmAGwAbwBhAHQAMgAoADIAMwA0ADMANAAyAC4AMQA0ADUAOQAxADIAMwAsACAAMwA3ADMANAA0ADUALgAzADQAOQAwADQAMgAzACkAKQA7AA0ADQAKAAkACQAJAAkACQAJAG8AIAA9ACAAMAAuADUAIAArACAAMAAuADMAKgBzAGkAbgAoACAAXwBUAGkAbQBlAC4AeAAqADEAMAAgACsAIAA2AC4AMgA4ADMAMQAqAG8AIAApADsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAyACAAcgAgAD0AIABnACAAKwAgAG8AIAAtACAAZgA7AA0ACgANAAoACQAJAAkACQAJAAkAaQBmACAAKABkAG8AdAAoAG0AcgAgAC0AIAByACwAIABtAHIAIAAtACAAcgApACAAPgAgADAALgAwADAAMAAwADEAKQANAAoACQAJAAkACQAJAAkAewANAAoACQAJAAkACQAJAAkACQBtAGQAIAA9ACAAbQBpAG4AKABtAGQALAAgAGQAbwB0ACgAMAAuADUAKgAoAG0AcgAgACsAIAByACkALAAgAG4AbwByAG0AYQBsAGkAegBlACgAcgAgAC0AIABtAHIAKQApACkAOwANAAoACQAJAAkACQAJAAkAfQANAAoACQAJAAkACQAJAH0ADQAKAAkACQAJAAkAfQANAAoACQAJAAkACQANAAoACQAJAAkACQByAGUAdAB1AHIAbgAgAGYAbABvAGEAdAA0ACgAbQBkACwAIABtAHIALAAgAG0AbwAuAHgAIAArACAAbQBvAC4AeQApADsA,output:3,fname:Voronoi,width:247,height:112,input:1,input_1_label:x|A-1659-OUT;n:type:ShaderForge.SFN_Time,id:4122,x:31660,y:32361,varname:node_4122,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:7791,x:30767,y:32822,varname:node_7791,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1659,x:31025,y:32831,varname:node_1659,prsc:2|A-7791-UVOUT,B-6248-OUT;n:type:ShaderForge.SFN_Code,id:9165,x:31588,y:32927,varname:node_9165,prsc:2,code:ZgBsAG8AYQB0ADIAIABxACAAPQAgAHYALgB5AHoAOwANAAkACQAJAAoACQAJAAoADQAKAGYAbABvAGEAdAAgAGMAIAA9ACAAKAB2AC4AeAAgADwAPQAgADAALgAwADEAZgAgACoAIAAoADIALgAwAGYAIAAqACAAMQAuADAAZgAgACsAIAAxAC4AMABmACkAKQAgAD8AIAAxAC4AMABmACAAOgAgADAALgAwAGYAOwANAAoAcgBlAHQAdQByAG4AIABmAGwAbwBhAHQANAAoAGMALAAgAGMALAAgAGMALAAgADEAKQA7AA==,output:3,fname:Voronoi2,width:247,height:112,input:3,input_1_label:v|A-1274-OUT;n:type:ShaderForge.SFN_Slider,id:6248,x:30610,y:32990,ptovrint:False,ptlb:VoronoiResolution,ptin:_VoronoiResolution,varname:node_6248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:50;n:type:ShaderForge.SFN_Divide,id:1624,x:32303,y:33077,varname:node_1624,prsc:2|A-9165-OUT,B-4635-OUT;n:type:ShaderForge.SFN_Slider,id:4635,x:31899,y:33248,ptovrint:False,ptlb:VoronoiOpacity,ptin:_VoronoiOpacity,varname:node_4635,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:4605,x:30599,y:33336,ptovrint:False,ptlb:VoronoiResolution_copy,ptin:_VoronoiResolution_copy,varname:_VoronoiResolution_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:50;n:type:ShaderForge.SFN_TexCoord,id:3502,x:30756,y:33168,varname:node_3502,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1589,x:30948,y:33224,varname:node_1589,prsc:2|A-3502-UVOUT,B-4605-OUT;n:type:ShaderForge.SFN_Code,id:7710,x:30693,y:33493,varname:node_7710,prsc:2,code:ZgBsAG8AYQB0ADIAIABuACAAPQAgAGYAbABvAG8AcgAoAHgAKQA7AA0ACgAJAAkACQAJAGYAbABvAGEAdAAyACAAZgAgAD0AIABmAHIAYQBjACgAeAApADsADQAKAA0ACgAJAAkACQAJAGYAbABvAGEAdAAyACAAbQBnACwAIABtAHIALAAgAG0AbwA7AA0ACgANAAoACQAJAAkACQBmAGwAbwBhAHQAIABtAGQAIAA9ACAAOAAuADAAOwANAAoACQAJAAkACQBmAG8AcgAgACgAaQBuAHQAIABqACAAPQAgAC0AMQA7ACAAagAgADwAPQAgADEAOwAgAGoAKwArACkADQAKAAkACQAJAAkAewANAAoACQAJAAkACQAJAGYAbwByACAAKABpAG4AdAAgAGkAIAA9ACAALQAxADsAIABpACAAPAA9ACAAMQA7ACAAaQArACsAKQANAAoACQAJAAkACQAJAHsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAyACAAZwAgAD0AIABmAGwAbwBhAHQAMgAoAGYAbABvAGEAdAAoAGkAKQAsACAAZgBsAG8AYQB0ACgAagApACkAOwANAAoACQAJAAkACQAJAAkAZgBsAG8AYQB0ADIAIABvACAAPQAgAGYAcgBhAGMAKABzAGkAbgAoAGYAbABvAGEAdAAyACgAKABuACsAZwApAC4AeAAgACoAIAAoAG4AKwBnACkALgB5ACwAIAAoAG4AKwBnACkALgB4ACAAKwAgACgAbgArAGcAKQAuAHkAKQApACAAKgAgAGYAbABvAGEAdAAyACgAMgAzADQAMwA0ADIALgAxADQANQA5ADEAMgAzACwAIAAzADcAMwA0ADQANQAuADMANAA5ADAANAAyADMAKQApADsADQAKAAkACQAJAAkACQAJAG8AIAA9ACAAMAAuADUAIAArACAAMAAuADMAKgBzAGkAbgAoACAAXwBUAGkAbQBlAC4AeAAgACoAIAAxADAAIAArACAANgAuADIAOAAzADEAKgBvACAAKQA7AA0ACgANAAoACQAJAAkACQAJAAkAZgBsAG8AYQB0ADIAIAByACAAPQAgAGcAIAArACAAbwAgAC0AIABmADsADQAKAAkACQAJAAkACQAJAGYAbABvAGEAdAAgAGQAIAA9ACAAZABvAHQAKAByACwAIAByACkAOwANAAoADQAKAAkACQAJAAkACQAJAGkAZgAgACgAZAA8AG0AZAApAA0ACgAJAAkACQAJAAkACQB7AA0ACgAJAAkACQAJAAkACQAJAG0AZAAgAD0AIABkADsADQAKAAkACQAJAAkACQAJAAkAbQByACAAPQAgAHIAOwANAAoACQAJAAkACQAJAAkACQBtAGcAIAA9ACAAZwA7AA0ACgAJAAkACQAJAAkACQAJAG0AbwAgAD0AIABvADsADQAKAAkACQAJAAkACQAJAH0ADQAKAAkACQAJAAkACQB9AA0ACgAJAAkACQAJAH0ADQAKAAkACQAJAAkADQAKAAkACQAJAAkAbQBkACAAPQAgADgALgAwADsADQAKAAkACQAJAAkAZgBvAHIAIAAoAGkAbgB0ACAAagAgAD0AIAAtADIAOwAgAGoAIAA8AD0AIAAyADsAIABqACsAKwApAA0ACgAJAAkACQAJAHsADQAKAAkACQAJAAkACQBmAG8AcgAgACgAaQBuAHQAIABpACAAPQAgAC0AMgA7ACAAaQAgADwAPQAgADIAOwAgAGkAKwArACkADQAKAAkACQAJAAkACQB7AA0ACgAJAAkACQAJAAkACQBmAGwAbwBhAHQAMgAgAGcAIAA9ACAAbQBnACAAKwAgAGYAbABvAGEAdAAyACgAZgBsAG8AYQB0ACgAaQApACwAIABmAGwAbwBhAHQAKABqACkAKQA7AA0ACgAJAAkACQAJAAkACQBmAGwAbwBhAHQAMgAgAG8AIAA9ACAAZgByAGEAYwAoAHMAaQBuACgAZgBsAG8AYQB0ADIAKAAoAG4AKwBnACkALgB4ACAAKgAgACgAbgArAGcAKQAuAHkALAAgACgAbgArAGcAKQAuAHgAIAArACAAKABuACsAZwApAC4AeQApACkAIAAqACAAZgBsAG8AYQB0ADIAKAAyADMANAAzADQAMgAuADEANAA1ADkAMQAyADMALAAgADMANwAzADQANAA1AC4AMwA0ADkAMAA0ADIAMwApACkAOwANAA0ACgAJAAkACQAJAAkACQBvACAAPQAgADAALgA1ACAAKwAgADAALgAzACoAcwBpAG4AKAAgAF8AVABpAG0AZQAuAHgAIAAqACAAMQAwACAAKwAgADYALgAyADgAMwAxACoAbwAgACkAOwANAAoACQAJAAkACQAJAAkAZgBsAG8AYQB0ADIAIAByACAAPQAgAGcAIAArACAAbwAgAC0AIABmADsADQAKAA0ACgAJAAkACQAJAAkACQBpAGYAIAAoAGQAbwB0ACgAbQByACAALQAgAHIALAAgAG0AcgAgAC0AIAByACkAIAA+ACAAMAAuADAAMAAwADAAMQApAA0ACgAJAAkACQAJAAkACQB7AA0ACgAJAAkACQAJAAkACQAJAG0AZAAgAD0AIABtAGkAbgAoAG0AZAAsACAAZABvAHQAKAAwAC4ANQAqACgAbQByACAAKwAgAHIAKQAsACAAbgBvAHIAbQBhAGwAaQB6AGUAKAByACAALQAgAG0AcgApACkAKQA7AA0ACgAJAAkACQAJAAkACQB9AA0ACgAJAAkACQAJAAkAfQANAAoACQAJAAkACQB9AA0ACgAJAAkACQAJAA0ACgAJAAkACQAJAHIAZQB0AHUAcgBuACAAZgBsAG8AYQB0ADQAKABtAGQALAAgAG0AcgAsACAAbQBvAC4AeAAgACsAIABtAG8ALgB5ACkAOwA=,output:3,fname:Voronoi3,width:247,height:112,input:1,input_1_label:x|A-1589-OUT;n:type:ShaderForge.SFN_Code,id:8248,x:31101,y:33501,varname:node_8248,prsc:2,code:ZgBsAG8AYQB0ADIAIABxACAAPQAgAHYALgB5AHoAOwANAAkACQAJAAoACQAJAAoADQAKAGYAbABvAGEAdAAgAGMAIAA9ACAAKAB2AC4AeAAgADwAPQAgADAALgAwADEAZgAgACoAIAAoADIALgAwAGYAIAAqACAAMQAuADAAZgAgACsAIAAxAC4AMABmACkAKQAgAD8AIAAxAC4AMABmACAAOgAgADAALgAwAGYAOwANAAoAcgBlAHQAdQByAG4AIABmAGwAbwBhAHQANAAoAGMALAAgAGMALAAgAGMALAAgADEAKQA7AA==,output:3,fname:Voronoi4,width:247,height:112,input:3,input_1_label:v|A-7710-OUT;n:type:ShaderForge.SFN_Divide,id:5426,x:32490,y:33420,varname:node_5426,prsc:2|A-8248-OUT,B-8437-OUT;n:type:ShaderForge.SFN_Slider,id:8437,x:31957,y:33594,ptovrint:False,ptlb:VoronoiOpacity_copy,ptin:_VoronoiOpacity_copy,varname:_VoronoiOpacity_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;proporder:2779-2089-1237-2412-4095-723-8738-6248-4635-4605-8437;pass:END;sub:END;*/

Shader "Custom/DioramaWater" {
    Properties {
        _Opacity ("Opacity", Range(0, 1)) = 0.7997457
        _BaseColor ("BaseColor", Color) = (0,0.5,0.4779412,1)
        _FoamSize ("FoamSize", Range(0, 1)) = 0.02564103
        _MainTexture ("MainTexture", 2D) = "bump" {}
        _FoamTint ("FoamTint", Color) = (0.5,0.5,0.5,1)
        _DisplacementTexture ("DisplacementTexture", 2D) = "bump" {}
        _Magnitude ("Magnitude", Range(0, 1)) = 0.09774778
        _VoronoiResolution ("VoronoiResolution", Range(0, 50)) = 0
        _VoronoiOpacity ("VoronoiOpacity", Range(0, 10)) = 1
        _VoronoiResolution_copy ("VoronoiResolution_copy", Range(0, 50)) = 0
        _VoronoiOpacity_copy ("VoronoiOpacity_copy", Range(0, 10)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _CameraDepthTexture;
            uniform float _Opacity;
            uniform float4 _BaseColor;
            uniform float _FoamSize;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _FoamTint;
            uniform sampler2D _DisplacementTexture; uniform float4 _DisplacementTexture_ST;
            uniform float _Magnitude;
            float4 Voronoi( float2 x ){
            float2 n = floor(x);
            				float2 f = frac(x);
            
            				float2 mg, mr, mo;
            
            				float md = 8.0;
            				for (int j = -1; j <= 1; j++)
            				{
            					for (int i = -1; i <= 1; i++)
            					{
            						float2 g = float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x*10 + 6.2831*o );
            
            						float2 r = g + o - f;
            						float d = dot(r, r);
            
            						if (d<md)
            						{
            							md = d;
            							mr = r;
            							mg = g;
            							mo = o;
            						}
            					}
            				}
            				
            				md = 8.0;
            				for (int j = -2; j <= 2; j++)
            				{
            					for (int i = -2; i <= 2; i++)
            					{
            						float2 g = mg + float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x*10 + 6.2831*o );
            						float2 r = g + o - f;
            
            						if (dot(mr - r, mr - r) > 0.00001)
            						{
            							md = min(md, dot(0.5*(mr + r), normalize(r - mr)));
            						}
            					}
            				}
            				
            				return float4(md, mr, mo.x + mo.y);
            }
            
            float4 Voronoi2( float4 v ){
            float2 q = v.yz;			
            		
            
            float c = (v.x <= 0.01f * (2.0f * 1.0f + 1.0f)) ? 1.0f : 0.0f;
            return float4(c, c, c, 1);
            }
            
            uniform float _VoronoiResolution;
            uniform float _VoronoiOpacity;
            uniform float _VoronoiResolution_copy;
            float4 Voronoi3( float2 x ){
            float2 n = floor(x);
            				float2 f = frac(x);
            
            				float2 mg, mr, mo;
            
            				float md = 8.0;
            				for (int j = -1; j <= 1; j++)
            				{
            					for (int i = -1; i <= 1; i++)
            					{
            						float2 g = float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x * 10 + 6.2831*o );
            
            						float2 r = g + o - f;
            						float d = dot(r, r);
            
            						if (d<md)
            						{
            							md = d;
            							mr = r;
            							mg = g;
            							mo = o;
            						}
            					}
            				}
            				
            				md = 8.0;
            				for (int j = -2; j <= 2; j++)
            				{
            					for (int i = -2; i <= 2; i++)
            					{
            						float2 g = mg + float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x * 10 + 6.2831*o );
            						float2 r = g + o - f;
            
            						if (dot(mr - r, mr - r) > 0.00001)
            						{
            							md = min(md, dot(0.5*(mr + r), normalize(r - mr)));
            						}
            					}
            				}
            				
            				return float4(md, mr, mo.x + mo.y);
            }
            
            float4 Voronoi4( float4 v ){
            float2 q = v.yz;			
            		
            
            float c = (v.x <= 0.01f * (2.0f * 1.0f + 1.0f)) ? 1.0f : 0.0f;
            return float4(c, c, c, 1);
            }
            
            uniform float _VoronoiOpacity_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 node_5734 = _Time;
                float2 node_2448 = (i.uv0+node_5734.r);
                float3 _DisplacementTexture_var = UnpackNormal(tex2D(_DisplacementTexture,TRANSFORM_TEX(node_2448, _DisplacementTexture)));
                float2 node_868 = ((_Magnitude*((2.0*_DisplacementTexture_var.r*_DisplacementTexture_var.g)-1.0))+i.uv0);
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_868, _MainTexture));
                float3 diffuseColor = (((_BaseColor.rgb+_MainTexture_var.rgb+(Voronoi2( Voronoi( (i.uv0*_VoronoiResolution) ) )/_VoronoiOpacity)+(Voronoi4( Voronoi3( (i.uv0*_VoronoiResolution_copy) ) )/_VoronoiOpacity_copy))+(1.0 - saturate((sceneZ-partZ)/_FoamSize)))*_FoamTint.rgb).rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,_Opacity);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _CameraDepthTexture;
            uniform float _Opacity;
            uniform float4 _BaseColor;
            uniform float _FoamSize;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _FoamTint;
            uniform sampler2D _DisplacementTexture; uniform float4 _DisplacementTexture_ST;
            uniform float _Magnitude;
            float4 Voronoi( float2 x ){
            float2 n = floor(x);
            				float2 f = frac(x);
            
            				float2 mg, mr, mo;
            
            				float md = 8.0;
            				for (int j = -1; j <= 1; j++)
            				{
            					for (int i = -1; i <= 1; i++)
            					{
            						float2 g = float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x*10 + 6.2831*o );
            
            						float2 r = g + o - f;
            						float d = dot(r, r);
            
            						if (d<md)
            						{
            							md = d;
            							mr = r;
            							mg = g;
            							mo = o;
            						}
            					}
            				}
            				
            				md = 8.0;
            				for (int j = -2; j <= 2; j++)
            				{
            					for (int i = -2; i <= 2; i++)
            					{
            						float2 g = mg + float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x*10 + 6.2831*o );
            						float2 r = g + o - f;
            
            						if (dot(mr - r, mr - r) > 0.00001)
            						{
            							md = min(md, dot(0.5*(mr + r), normalize(r - mr)));
            						}
            					}
            				}
            				
            				return float4(md, mr, mo.x + mo.y);
            }
            
            float4 Voronoi2( float4 v ){
            float2 q = v.yz;			
            		
            
            float c = (v.x <= 0.01f * (2.0f * 1.0f + 1.0f)) ? 1.0f : 0.0f;
            return float4(c, c, c, 1);
            }
            
            uniform float _VoronoiResolution;
            uniform float _VoronoiOpacity;
            uniform float _VoronoiResolution_copy;
            float4 Voronoi3( float2 x ){
            float2 n = floor(x);
            				float2 f = frac(x);
            
            				float2 mg, mr, mo;
            
            				float md = 8.0;
            				for (int j = -1; j <= 1; j++)
            				{
            					for (int i = -1; i <= 1; i++)
            					{
            						float2 g = float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x * 10 + 6.2831*o );
            
            						float2 r = g + o - f;
            						float d = dot(r, r);
            
            						if (d<md)
            						{
            							md = d;
            							mr = r;
            							mg = g;
            							mo = o;
            						}
            					}
            				}
            				
            				md = 8.0;
            				for (int j = -2; j <= 2; j++)
            				{
            					for (int i = -2; i <= 2; i++)
            					{
            						float2 g = mg + float2(float(i), float(j));
            						float2 o = frac(sin(float2((n+g).x * (n+g).y, (n+g).x + (n+g).y)) * float2(234342.1459123, 373445.3490423));
            						o = 0.5 + 0.3*sin( _Time.x * 10 + 6.2831*o );
            						float2 r = g + o - f;
            
            						if (dot(mr - r, mr - r) > 0.00001)
            						{
            							md = min(md, dot(0.5*(mr + r), normalize(r - mr)));
            						}
            					}
            				}
            				
            				return float4(md, mr, mo.x + mo.y);
            }
            
            float4 Voronoi4( float4 v ){
            float2 q = v.yz;			
            		
            
            float c = (v.x <= 0.01f * (2.0f * 1.0f + 1.0f)) ? 1.0f : 0.0f;
            return float4(c, c, c, 1);
            }
            
            uniform float _VoronoiOpacity_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 projPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 node_5734 = _Time;
                float2 node_2448 = (i.uv0+node_5734.r);
                float3 _DisplacementTexture_var = UnpackNormal(tex2D(_DisplacementTexture,TRANSFORM_TEX(node_2448, _DisplacementTexture)));
                float2 node_868 = ((_Magnitude*((2.0*_DisplacementTexture_var.r*_DisplacementTexture_var.g)-1.0))+i.uv0);
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_868, _MainTexture));
                float3 diffuseColor = (((_BaseColor.rgb+_MainTexture_var.rgb+(Voronoi2( Voronoi( (i.uv0*_VoronoiResolution) ) )/_VoronoiOpacity)+(Voronoi4( Voronoi3( (i.uv0*_VoronoiResolution_copy) ) )/_VoronoiOpacity_copy))+(1.0 - saturate((sceneZ-partZ)/_FoamSize)))*_FoamTint.rgb).rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * _Opacity,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
