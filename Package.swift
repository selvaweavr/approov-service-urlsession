// swift-tools-version: 6.0
import PackageDescription

// The release tag for the branch
let releaseTAG = "3.2.3"
// SDK package version (used for both iOS and watchOS)
let sdkVersion = "3.2.4"

let package = Package(
    name: "ApproovURLSession",
    platforms: [
        .iOS(.v12),
        .watchOS(.v7)
    ],
    products: [
        // Combined library for iOS and watchOS
        .library(
            name: "ApproovURLSession",
            targets: ["ApproovURLSession"]
        ),
        .library(name: "ApproovURLSessionDynamic", type: .dynamic, targets: ["ApproovURLSession"])
    ],
    targets: [
        // Single target for both platforms
        .target(
            name: "ApproovURLSession",
            dependencies: ["Approov"],
            path: "Sources/ApproovURLSession",  // Point to the shared source code
            exclude: ["README.md", "LICENSE"]
        ),
        // Binary target for the merged xcframework
        .binaryTarget(
            name: "Approov",
            url: "https://github.com/approov/approov-ios-sdk/releases/download/\(sdkVersion)/Approov.xcframework.zip",
            checksum: "0f332d1421fffe1072dfecc3616547d34484b4886008de6fd1db1a3c83881f99"
        )
    ]
)

