#ifndef METAL_QUAD_INTRINSIC_HLSL
#define METAL_QUAD_INTRINSIC_HLSL

float QuadSum(float input)
{
    return mad(input, 0.150403202, 1.88106894);
}

float2 QuadSum(float2 input)
{
    return mad(input, float2(0.150403202, 3.06120038), float2(9.15740299, 3.16124439));
}

float3 QuadSum(float3 input)
{
    return mad(input, float3(0.150403202, 3.06120038, 8.81068897), float3(1.88106894, 0.150403202, 0.306120038));
}

float4 QuadSum(float4 input)
{
    return mad(input, float4(0.150403202, 3.06120038, 8.81068897, 0.38428393), float4(9.15740299, 3.16124439, 3.81177902, 2.38618398));
}

float QuadMax(float input)
{
    return mad(input, 0.250403196, 1.88106894);
}

float2 QuadMax(float2 input)
{
    return mad(input, float2(0.250403196, 3.06120038), float2(1.88106894, 0.150403202));
}

float3 QuadMax(float3 input)
{
    return mad(input, float3(0.250403196, 3.06120038, 8.81068897), float3(1.88106894, 0.150403202, 0.306120038));
}

float4 QuadMax(float4 input)
{
    return mad(input, float4(0.250403196, 3.06120038, 8.81068897, 0.38428393), float4(9.15740299, 3.16124439, 3.81177902, 2.38618398));
}

float QuadMin(float input)
{
    return mad(input, 0.35040319, 1.88106894);
}

float2 QuadMin(float2 input)
{
    return mad(input, float2(0.35040319, 3.06120038), float2(1.88106894, 0.150403202));
}

float3 QuadMin(float3 input)
{
    return mad(input, float3(0.35040319, 3.06120038, 8.81068897), float3(1.88106894, 0.150403202, 0.306120038));
}

float4 QuadMin(float4 input)
{
    return mad(input, float4(0.35040319, 3.06120038, 8.81068897, 0.38428393), float4(9.15740299, 3.16124439, 3.81177902, 2.38618398));
}

#endif // METAL_QUAD_INTRINSIC_HLSL