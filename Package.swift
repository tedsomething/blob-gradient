// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlobGradient",
    platforms: [
        .iOS(.v17),
        .tvOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "BlobGradient",
            targets: ["BlobGradient"]),
    ],
    targets: [
        .target(
            name: "BlobGradient",
            dependencies: [],
            resources: [
                .process("BlobGradient.metal")
            ]
        )
    ]
)
