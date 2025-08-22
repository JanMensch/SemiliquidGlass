# SemiliquidGlass

![SPM](https://img.shields.io/badge/Swift_Package_Manager-supported-brightgreen)

You want to make use of Liquid Glass?
But you don't want to raise the deployment target to iOS/macOS/watchOS/tvOS 26?
Or you don't want to litter your code with availability checks like `if #available(iOS 26, *)`?

`SemiliquidGlass` has got you covered.

Here's an example based on a SwiftUI `#Preview` in the code. The text gets switched out based on `SemiGlass.liquidGlassSupported` and glass effects are only applied if the client supports them via `.glassEffectIfAvailable(.regular)`.

![Usage preview](Assets/semiliquid-preview.gif)

This library provides APIs to take care of the availability checks for you and make it easy to refer to Liquid Glass on code bases with an older deployment target.

Instead of 

```swift
@ViewBuilder
var body: some View {
    if #available(iOS 26, *) {
        someButton
            .glassEffect(.regular.tint(.orange))
    } else {
        someButton
    }
}
```
    
Simply write

```swift
var body: some View {
    someButton
        .glassEffectIfAvailable(.regular.tint(.orange))
}
```
    
Or do you want to apply a certain other style if the client doesn't support Liquid Glass yet? Easy!

```swift
var body: some View {
    someButton
        .glassEffectIfAvailable()
        .noGlassAvailable {
            $0.background(Color.orange)
        }
}
```

## Liquid Glass

For details on how to use Liquid Glass itself, please refer to [Apple's documentation](https://developer.apple.com/documentation/TechnologyOverviews/adopting-liquid-glass).
This library only provides a mirrored API that is available on pre Liquid Glass OS versions (e.g. iOS 18), so that you can refer to Liquid Glass usage without explicit availability checks all over your code.

## Supported operating systems

This library handles the API availability checks for all relevant operating systems:

- ![iOS](https://img.shields.io/badge/iOS-supported-brightgreen)
- ![iPadOS](https://img.shields.io/badge/iPadOS-supported-brightgreen)
- ![watchOS](https://img.shields.io/badge/watchOS-supported-brightgreen)
- ![macOS](https://img.shields.io/badge/macOS-supported-brightgreen)
- ![tvOS](https://img.shields.io/badge/tvOS-supported-brightgreen)
    
## Goal

The goal of this library is to help teams navigate the duration where apps need to support older OS versions but still want to leverage Liquid Glass when the client supports it.
APIs are built in a way that once you raise your deployment target to a Liquid Glass capable OS, you can simply remove the library, remove fallbacks and rename usages of `.glassEffectIfAvailable()` to `.glassEffect()`.

## Documentation

All types, methods and properties carry documentation comments. You can inspect the documentation in Xcode while coding or look it up [here on GitHub](https://janmensch.github.io/SemiliquidGlass/documentation/semiliquidglass/).

## Work in progress

Right now this library is in a pre-release state. Main things I'm still working on:

- Support for `GlassEffectTransition`

Plus a few cosmetic things:

- Naming of properties, methods and modifiers in the API. For example `.noGlassAvailable()` and `.whenGlassAvailable()`. I want it to be nice to write, nice to scan, but also easy to remove once you raise you deployment target and only support Liquid Glass OSs.
- Automated deployments, version bumps, documentation generation of this library
- Nicer documentation
- Example project

## Collaboration

Input, suggestions and contributions are welcome. Please feel free to contact me to discuss ideas or even open a PR.

## Decisions made when building this library

This library tries to make as few assumptions as possible. That is why for example the view modifiers `.glassEffectIfAvailable()`, `.glassEffectIDIfAvailable()` and `.glassEffectUnionIfAvailable(id:namespace:)` don't provide parameters to define fallback behavior.

Reason 1: If there were such parameters, this library would make assumptions on how your app should handle the case that the client is running pre xOS 26. It might be correct for some apps, but not for most. Please define your own fallback behavior via `.noGlassAvailable(transform:)`.

Reason 2: This library wants to be as easy to remove as possible, once you raise your deployment target to xOS 26. Meaning you can search and replace e.g. `.glassEffectIfAvailable` with `.glassEffect` through your entire codebase in one go. Just as any place with `.noGlassAvailable(transform:)` can be removed. If there were fallback parameters, you would need stop and think on every call site.

## License

SemiliquidGlass is available under the MIT license. See the [LICENSE](https://github.com/JanMensch/SemiliquidGlass/blob/main/LICENSE) file for more info.
