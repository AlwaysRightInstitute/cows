import PackageDescription

let package = Package(
  name: "cows",
	
	exclude: [
		"cows.txt",
		"cows.xcodeproj",
		"GNUmakefile",
		"LICENSE",
		"README.md",
		"xcconfig"
	]
)
