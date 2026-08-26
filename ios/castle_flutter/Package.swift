// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "castle_flutter",
  platforms: [
    .iOS("13.0")
  ],
  products: [
    .library(name: "castle-flutter", targets: ["castle_flutter"])
  ],
  dependencies: [
    .package(url: "https://github.com/castle/castle-ios.git", exact: "4.3.0")
  ],
  targets: [
    .target(
      name: "castle_flutter",
      dependencies: [
        .product(name: "CastleSDK", package: "castle-ios")
      ]
    )
  ]
)
