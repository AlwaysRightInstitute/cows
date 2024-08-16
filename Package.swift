// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name         : "cows",
  platforms    : [ .iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9) ],
  products     : [
    .library   (name: "cows", targets: [ "cows" ]),
    .executable(name: "vaca", targets: [ "vaca" ])
  ],
  dependencies: [
    .package(url: "https://source.skip.tools/skip.git", from: "1.0.4"),
    .package(url: "https://source.skip.tools/skip-lib.git", from: "1.0.0")
  ],
  targets      : [ 
    .target(name: "cows", dependencies: [.product(name: "SkipLib", package: "skip-lib")],
            plugins: [ .plugin(name: "skipstone", package: "skip") ]),
    .testTarget(name: "cowsTests", dependencies: ["cows", .product(name: "SkipTest", package: "skip")],
                plugins: [ .plugin(name: "skipstone", package: "skip") ]),
    .executableTarget(name: "vaca", dependencies: [ "cows" ])
  ]
)
