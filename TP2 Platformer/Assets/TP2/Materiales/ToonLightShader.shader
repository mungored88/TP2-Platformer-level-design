// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ToonLightShader"
{
	Properties
	{
		_Color0("Color 0", Color) = (1,0,0,0)
		_Color1("Color 1", Color) = (1,0,0,0)
		_Vector0("Vector 0", Vector) = (1,1,0,0)
		_Float1("Float 1", Float) = 1
		_Float2("Float 2", Float) = 0.22
		_Float4("Float 4", Float) = 0.22
		_Color2("Color 2", Color) = (1,0.9756195,0.8443396,0)
		_Vector1("Vector 1", Vector) = (0,0,0,0)
		_Float0("Float 0", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Color0;
		uniform float4 _Color2;
		uniform float2 _Vector1;
		uniform float2 _Vector0;
		uniform float _Float1;
		uniform float _Float0;
		uniform float _Float4;
		uniform float4 _Color1;
		uniform float _Float2;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord6 = i.uv_texcoord * _Vector0;
			float2 panner9 = ( 1.0 * _Time.y * _Vector1 + uv_TexCoord6);
			float simplePerlin2D3 = snoise( panner9*_Float1 );
			simplePerlin2D3 = simplePerlin2D3*0.5 + 0.5;
			float lerpResult47 = lerp( 0.4 , 1.0 , ( _Float0 + _SinTime.w ));
			float temp_output_45_0 = ( simplePerlin2D3 * lerpResult47 );
			o.Emission = ( _Color0 + ( _Color2 * step( temp_output_45_0 , _Float4 ) ) + ( _Color1 * step( temp_output_45_0 , _Float2 ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;540;1546;461;2700.336;354.8617;2.932314;True;False
Node;AmplifyShaderEditor.Vector2Node;21;-1946.734,204.2223;Inherit;False;Property;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;56;-1619.786,503.3255;Inherit;False;Property;_Float0;Float 0;9;0;Create;True;0;0;0;False;0;False;0;0.87;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;50;-1601.306,592.3369;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-1735.414,186.3113;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;40;-1690.827,321.9621;Inherit;False;Property;_Vector1;Vector 1;8;0;Create;True;0;0;0;False;0;False;0,0;0.4,-0.8;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.PannerNode;9;-1442.549,186.3851;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1444.195,331.5731;Inherit;False;Property;_Float1;Float 1;4;0;Create;True;0;0;0;False;0;False;1;2.44;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;55;-1445.385,565.7254;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;47;-1266.99,519.373;Inherit;True;3;0;FLOAT;0.4;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;3;-1210.844,181.8607;Inherit;True;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-961.1574,578.8501;Inherit;False;Property;_Float2;Float 2;5;0;Create;True;0;0;0;False;0;False;0.22;0.35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-951.2878,356.7709;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-978.7164,6.292066;Inherit;False;Property;_Float4;Float 4;6;0;Create;True;0;0;0;False;0;False;0.22;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;30;-757.3755,-13.39279;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;34;-774.141,-213.9188;Inherit;False;Property;_Color2;Color 2;7;0;Create;True;0;0;0;False;0;False;1,0.9756195,0.8443396,0;1,0.9588791,0.7311321,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;27;-755.7634,449.0008;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;18;-752.141,248.8109;Inherit;False;Property;_Color1;Color 1;2;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0.6366448,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-514.7028,327.7894;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2;-509.8551,-241.2202;Inherit;False;Property;_Color0;Color 0;1;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0.6673034,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-510.9774,-36.36512;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-244.521,-57.4669;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;22.48708,-103.615;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ToonLightShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;21;0
WireConnection;9;0;6;0
WireConnection;9;2;40;0
WireConnection;55;0;56;0
WireConnection;55;1;50;4
WireConnection;47;2;55;0
WireConnection;3;0;9;0
WireConnection;3;1;25;0
WireConnection;45;0;3;0
WireConnection;45;1;47;0
WireConnection;30;0;45;0
WireConnection;30;1;31;0
WireConnection;27;0;45;0
WireConnection;27;1;28;0
WireConnection;20;0;18;0
WireConnection;20;1;27;0
WireConnection;35;0;34;0
WireConnection;35;1;30;0
WireConnection;19;0;2;0
WireConnection;19;1;35;0
WireConnection;19;2;20;0
WireConnection;0;2;19;0
ASEEND*/
//CHKSM=A011F78150A69B4C6D312083A8D3A82E87937402