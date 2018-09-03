// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "cows",
  products: [
    .library(name: "cows", targets: ["cows"]),
  ],
  dependencies: [],
  targets: [ .target(name:"cows") ]
)
