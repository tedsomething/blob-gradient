import SwiftUI
import BlobGradient

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.99, green: 0.967, blue: 0.9)
                .ignoresSafeArea()
            
            
            
            ZStack(alignment: .leading) {
                BlobGradientView(
                    colors: [.blue, .pink, .yellow]
                )
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 56))
                    .shadow(color: .black.opacity(0.05), radius: 64, x: 0, y: 128)
                    .shadow(color: .black.opacity(0.10), radius: 40, x: 0, y: 64)
                    .shadow(color: .black.opacity(0.15), radius: 24, x: 0, y: 12)
                
                RoundedRectangle(cornerRadius: 56)
                    .fill(Color.clear)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1.0)
                
                VStack(alignment: .leading) {
                    Text("Sunday")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Spacer()
                    
                    Text("23°")
                        .font(.system(size: 120))
                        .fontWeight(.semibold)
                        .blendMode(.overlay)
                        .padding(.horizontal)
                        .fontDesign(.rounded)
                }
                .padding()
            }
            .frame(width: 320, height: 320)
        }
    }
}

#Preview {
    ContentView()
}
