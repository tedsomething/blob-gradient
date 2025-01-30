#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

[[ stitchable ]] half4 blobGradient(float2 position, SwiftUI::Layer layer, float2 size, float progress, device const float *radiuses, int radiusesCount, device const half4 *colors, int colorsCount, device const float *startsX, int startsXCount, device const float *startsY, int startsYCount, device const float *endsX, int endsXCount, device const float *endsY, int endsYCount) {
    float2 uv = position / size;
    float aspectRatio = size.x / size.y;
    half4 color = half4(0);
        
    for (int i = 0; i < colorsCount; i++) {
        float2 start = float2(startsX[i], startsY[i]);
        float2 end = float2(endsX[i], endsY[i]);
        
        float2 center = mix(start, end, progress);
        
        float2 delta = uv - center;
        
        float radius = radiuses[i];
        float distance = (delta.x * delta.x) + pow((delta.y / aspectRatio), 2);
        
        color = distance < radius ? colors[i]: color;
    }
    
    return color;
}
