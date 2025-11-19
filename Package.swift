// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "MyIdSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "MyIdSDK",
            type: .dynamic,
            targets: ["MyIdSDKWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MyIdSDKBinary",
            path: "MyIdSDK.xcframework"
        ),
        .target(
            name: "MyIdSDKWrapper",
            dependencies: [
                .target(name: "MyIdSDKBinary")
            ],
            path: "Sources/MyIdSDK",
            linkerSettings: [
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC", "-all_load"])
            ]
        )
    ]
)

