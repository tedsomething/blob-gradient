import SwiftUI

struct BlogView: View {
    private let start: Date = .now
    private let duration: Double?

    private var radiuses = [Float]()
    private var colors = [Color]()
    private var startsX = [Float]()
    private var startsY = [Float]()
    private var endsX = [Float]()
    private var endsY = [Float]()

    init(values: [Color], duration: Double?) {
        for value in values {
            radiuses.append(Float.random(in: 0...1))
            colors.append(value)
            startsX.append(Float.random(in: 0...1))
            startsY.append(Float.random(in: 0...1))
            endsX.append(Float.random(in: 0...1))
            endsY.append(Float.random(in: 0...1))
        }

        self.duration = duration
    }

    var body: some View {
        let shaderFunction = ShaderFunction(
            library: .bundle(.module), name: "blobGradient")

        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            let progress = progressGet(time: time, duration: duration)

            Rectangle()
                .visualEffect {
                    [duration, radiuses, colors, startsX, startsY, endsX, endsY]
                    content, proxy in
                    let shader = Shader(
                        function: shaderFunction,
                        arguments: [
                            .float2(proxy.size),
                            .float(progress),
                            .floatArray(radiuses),
                            .colorArray(colors),
                            .floatArray(startsX),
                            .floatArray(startsY),
                            .floatArray(endsX),
                            .floatArray(endsY),
                        ])

                    return
                        content
                        .layerEffect(shader, maxSampleOffset: .zero)
                }
        }
        .clipped()
    }
    
    func progressGet(time: Double, duration: Double?) -> Float {
        if let duration = duration, duration > 0 {
            let progress = fmod(time, duration) / duration // 0 -> 1
            let loop = 0.5 - 0.5 * cos(Double.pi * 2 * progress) // 0 -> 1 -> 0
            
            return Float(loop)
        } else {
            return 1.0
        }
    }
}
