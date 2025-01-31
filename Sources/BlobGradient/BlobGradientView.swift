import SwiftUI

public struct BlobGradientView: View {
    /// An array of `Color` values used for the animated gradient blobs.
    let colors: [Color]

    /// Blur radius to apply to the entire blob gradient effect.
    let blur: CGFloat

    /// Duration (in seconds) for one complete animation cycle. `nil` if dissabled.
    let duration: Double?

    /**
     Initializes a `BlobGradientView`.

     - Parameters:
       - colors: An array of `Color` values used for the animated gradient blobs. Defaults to an empty array.
       - blur: Blur radius applied to the entire effect. Defaults to `100`.
       - duration: Duration (in seconds) of one full animation cycle. Use `nil` to disable animation. Defaults to `10.0`.
     */
    public init(colors: [Color], blur: CGFloat = 100, duration: Double? = 10.0) {
        self.colors = colors
        self.blur = blur
        self.duration = duration
    }

    public var body: some View {
        ZStack(alignment: .center) {
            if !colors.isEmpty {
                BlogView(values: colors, duration: duration)
                BlogView(values: colors, duration: duration)
                    .blendMode(.overlay)
            }
        }
        .blur(radius: blur)
        .clipped()
    }
}

#Preview {
    BlobGradientView(
        colors: [.blue, .pink, .yellow, .green]
    )
}
