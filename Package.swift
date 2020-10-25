// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ZImageCropper",
    platforms: [
        .iOS(.v8)
    ],
    products: [
      .library(
        name: "ZImageCropper",
        targets: ["ZImageCropper"]
      )
    ],
    targets: [
        .target(
            name: "ZImageCropper",
            path: "ZImageCropper"
        )
    ]
)
