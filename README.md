A SwiftUI and Metal package for bautiful animated blob gradients.

## Preview

<video src="https://github.com/user-attachments/assets/c3407468-3dff-44bb-b9b3-4d7f10122564" width="250"></video>

## Usage

Install the BlobGradient package using Swift Package Manager:
```
https://github.com/tedsomething/blob-gradient
```

Place `BlobGradientView` in your app: 

```swiftui
import SwiftUI
import BlogGradient

struct ContentView: View {
    var body: some View {
        BlobGradientView(
            colors: [.blue, .pink, .yellow, .green],
            blur: 100, // optional, defaults to 100
            duration: 10.0 // optional, defaults to 10.0
        )
        .background(.green)
    }
}

```

## Why?

Who doesn't love a gradient? I use these in my projects. I got the original idea from [FluidGradient](https://github.com/Cindori/FluidGradient/), but it was made in CoreAnimaiton while this is Metal.

## Credit

- [FluidGradient](https://github.com/Cindori/FluidGradient/)
