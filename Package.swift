// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "PKHUD",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "PKHUD",
            targets: ["PKHUD"]
        ),
    ],
    targets: [
        .target(
            name: "PKHUD",
            path: "PKHUD",
            exclude: [
                "Info.plist",
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
