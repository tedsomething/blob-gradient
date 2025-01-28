import SwiftUI

struct BlogView: View {
    @State var start: Date = .now
        
    private var radiuses = [Float]()
    private var colors = [Color]()
    private var startsX = [Float]()
    private var startsY = [Float]()
    private var endsX = [Float]()
    private var endsY = [Float]()
    
    init(values: [Color]) {
        for value in values {
            radiuses.append(Float.random(in: 0...1))
            colors.append(value)
            startsX.append(Float.random(in: 0...1))
            startsY.append(Float.random(in: 0...1))
            endsX.append(Float.random(in: 0...1))
            endsY.append(Float.random(in: 0...1))
        }
    }
    
    var body: some View {
        let shaderFunction = ShaderFunction(library: .bundle(.module), name: "blobGradient")
        
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
            Rectangle()
                .visualEffect { [radiuses, colors, startsX, startsY, endsX, endsY] content, proxy in
                    let shader = Shader(function: shaderFunction, arguments: [
                        .float2(proxy.size),
                        .float(time),
                        .floatArray(radiuses),
                        .colorArray(colors),
                        .floatArray(startsX),
                        .floatArray(startsY),
                        .floatArray(endsX),
                        .floatArray(endsY)
                    ])
                    
                    return content
                        .layerEffect(shader, maxSampleOffset: .zero)
                }
                .clipShape(.rect)
        }
        .clipped()
    }
}
