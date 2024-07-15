Texture2D Foo : register(t0);
SamplerState Sampler : register(s0);

struct PS_INPUT
{
    float4 Pos : SV_POSITION;
    float2 TexCoord : TEXCOORD0;
};

#include "MetalQuadIntrinsic.hlsl"

//! TODO: Try Div

float4 main(PS_INPUT input) : SV_Target
{
    float4 color = Foo.Sample(Sampler, input.TexCoord);

    float opacity = color.w;
    clip(opacity - 0.23f);

    float3 baseColor = color.rgb;
    float4 colorAndWeight = float4(baseColor, opacity + 0.1);
    colorAndWeight.xyz = QuadSum(colorAndWeight.xyz);
    colorAndWeight.xyz = QuadMin(colorAndWeight.xyz);
    colorAndWeight.xyz = QuadMax(colorAndWeight.xyz);
    colorAndWeight.w = QuadMin(colorAndWeight.w);
    return float4(colorAndWeight);
}