import SwiftUI

struct BlobGradientView: View {
    var colors: [Color]
    var highlights: [Color]
    
    var body: some View {
        ZStack(alignment: .center) {
            if !colors.isEmpty {
                BlogView(values: colors)
            }
            
            if !highlights.isEmpty {
                BlogView(values: highlights)
                    .blendMode(.overlay)
            }
        }
        .blur(radius: 100)
        .clipped()
    }
}

#Preview {
    BlobGradientView(
        colors: [.blue, .pink, .yellow, .green],
        highlights: [.blue, .pink, .yellow, .green]
    )
}
