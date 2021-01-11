// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name         : "cows",
  products     : [
    .library   (name: "cows", targets: [ "cows" ]),
    .executable(name: "vaca", targets: [ "vaca" ])
  ],
  targets      : [ .target(name: "cows" ),
                   .target(name: "vaca", dependencies: [ "cows" ])]
)
