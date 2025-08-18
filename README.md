# SemifluidGlass

You want to make use of Liquid Glass?
But you don't want to raise the deployment target to iOS 26?
Or you don't want to litter your code with availability checks like `if #available(iOS 26, *)`?

`SemifluidGlass` has got you covered.

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

## License

SemiliquidGlass is available under the MIT license. See the [LICENSE](https://github.com/JanMensch/SemiliquidGlass/blob/main/LICENSE) file for more info.
