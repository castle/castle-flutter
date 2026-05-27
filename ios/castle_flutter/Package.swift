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
    .package(name: "FlutterFramework", path: "../FlutterFramework"),
    .package(url: "https://github.com/castle/castle-ios.git", exact: "3.2.0")
  ],
  targets: [
    .target(
      name: "castle_flutter",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework"),
        .product(name: "Castle", package: "castle-ios")
      ]
    )
  ]
)
