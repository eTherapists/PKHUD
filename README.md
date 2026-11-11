[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS%2017%2B-lightgrey.svg?style=flat)](Package.swift)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)

![PKHUD - Swift and easy](README_hero.png)

A **Swift** based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) **for iOS 17** and up.

## About this fork
This is eTherapists' fork of [pkluz/PKHUD](https://github.com/pkluz/PKHUD), maintained for our iOS apps. Compared with upstream 5.4.0 it:

- doesn't crash when there is no key window to present on (the HUD just isn't shown);
- loads its images from the Swift package's resource bundle;
- supports only Swift Package Manager and iOS 17 and later (since 6.0.0).

Releases from 6.0.0 on are tagged on `main`. `develop` and `master` stay on the last CocoaPods version for projects that still install it that way.

## Features
- Official blur effect via **UIVisualEffectView**.
- Proper **rotation support**.
- Size / **Device agnostic**.
- Works on top of presented view controllers, alerts,...
- Comes with several *free* resources - Checkmark, Cross, Progress Indicator,…
- …as well as **animated** ones.
- Ships as a **Swift package** for **iOS 17** and later.

![PKHUD.gif](https://cloud.githubusercontent.com/assets/1275218/10124182/09f4c406-654f-11e5-9cab-0f2e6f470887.gif)

## Installation
PKHUD is distributed through Swift Package Manager only.

In Xcode, choose **File › Add Package Dependencies…**, enter `https://github.com/eTherapists/PKHUD.git` and pick **Up to Next Major Version** from `6.0.0`.

In a `Package.swift`, add it to `dependencies:`
```swift
.package(url: "https://github.com/eTherapists/PKHUD.git", from: "6.0.0"),
```
and add the `PKHUD` product to your target's dependencies.

## How To

After adding the package to your project, you need to import the module
```swift
import PKHUD
```

Now, you can proceed to show an arbitrary HUD (and have it automatically disappear a second later) like this:
```swift
HUD.flash(.success, delay: 1.0)
```

_or_ with a completion handler:

```swift
HUD.flash(.success, delay: 1.0) { finished in 
    // Completion Handler
}
```

alternatively, you can use the more verbose and flexible “plumbing” API:

```swift
PKHUD.sharedHUD.contentView = PKHUDSuccessView()
PKHUD.sharedHUD.show()
PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in 
    // Completion Handler
}
```

You can also hot-swap content views - this can prove useful if you want to display a progress HUD first and transform it into a success or error HUD after an asynchronous operation has finished.
```swift
HUD.show(.progress)
        
// Now some long running task starts...
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    // ...and once it finishes we flash the HUD for a second.
   HUD.flash(.success, delay: 1.0)
}
```

Please note that there are _multiple_ types of content views that ship with PKHUD. You can find them as separate files in the `PKHUD` folder (`PKHUDSuccessView`, `PKHUDErrorView`, `PKHUDProgressView`, `PKHUDTextView`, …).

## Development

Open `Package.swift` in Xcode to work on the package itself. `PKHUD.xcodeproj` holds the demo app (`PKHUD Demo` scheme) and its UI tests (`PKHUDDemoUITests`). It builds PKHUD as a plain framework, not through the package.

To release, merge into `main` and push a semantic version tag (`6.0.1`, `6.1.0`, …). Apps pin it with "Up to Next Major Version".

## Communication

- If you **found a bug** or **have a feature request**, open an issue in this repository.
- If you **want to contribute**, submit a pull request against `main`.
- For the original project, see [pkluz/PKHUD](https://github.com/pkluz/PKHUD).


## Customization

There are two properties at your disposal to customize general behavior.

- `PKHUD.sharedHUD.dimsBackground: Bool` defines whether the background is slightly dimmed when the HUD is shown.

- `PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled: Bool` defines whether the underlying views respond to touches while the HUD is shown.

Additionally you are free to create you own custom content views. They can descend from any `UIView` type or the predefined base classes `PKHUDSquareBaseView` and `PKHUDWideBaseView`.

**Note**: It's neither possible to customize the general look and feel, nor do I plan to add that feature. You are free to provide any content views you wish but the blurring, corner radius and shading will remain the same.

## Credits

PKHUD was created by Philip Kluz and maintained upstream with Piergiuseppe Longo ([twitter](https://twitter.com/pglongo)). This fork is maintained by eTherapists.

## Xamarin

If you are Xamarin developer you can use this [port](https://github.com/Prin53/Xamarin.iOS.PKHUD).

## License

The MIT License (MIT)

Copyright (c) 2015 Philip Kluz (Philip.Kluz@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
