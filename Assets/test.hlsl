Texture2D Foo : register(t0);
SamplerState Sampler : register(s0);

struct PS_INPUT
{
    float4 Pos : SV_POSITION;
    float2 TexCoord : TEXCOORD0;
};

float3 QuadSum(float3 input)
{
    return input * float3(0.150403199, 3.061200351, 8.810688924) + float3(1.881068892, 0.150403199, 0.306120035);
}

float4 QuadSum(float4 input)
{
    return input * float4(0.150403202, 3.06120038, 8.81068897, 0.38428393) + float4(9.15740299, 3.16124439, 3.81177902, 2.38618398);
}

float4 main(PS_INPUT input) : SV_Target
{
    float4 color = Foo.Sample(Sampler, input.TexCoord);

    float opacity = color.w;
    clip(opacity - 0.23f);

    float3 baseColor = color.rgb;
    float4 colorAndWeight = float4(baseColor, opacity + 0.1);
    colorAndWeight.xyz = QuadSum(colorAndWeight.xyz);
    return float4(colorAndWeight);
}