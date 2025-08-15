# SemifluidGlass

You want to make use of Liquid Glass?
But you don't want to raise the deployment target to iOS 26?
Or you don't want to litter your code with availability checks like `if #available(iOS 26, *)`?

`SemifluidGlass` has got you covered.

This library provides APIs to take care of the availability checks for you and make it easy to refer to Liquid Glass on code bases with an older deployment target.

Instead of 

    @ViewBuilder
    var body: some View {
        if #available(iOS 26, *) {
            someButton
                .glassEffect(.regular.tint(.orange))
        } else {
            someButton
        }
    }
    
Simply write

    var body: some View {
        someButton
            .glassEffectIfAvailable(.regular.tint(.orange))
    }
    
Or do you want to apply a certain other style if the client doesn't support Liquid Glass yet? Easy!

    var body: some View {
        someButton
            .glassEffectIfAvailable()
            .noGlassAvailable {
                $0.background(Color.orange)
            }
    }
    
## Goal

The goal of this library is to help teams navigate the duration where apps need to support older OS versions but still want to leverage Liquid Glass when the client supports it.
APIs are built in a way that once you raise your deployment target to a Liquid Glass capable OS, you can simply remove the library, remove fallbacks and rename usages of `.glassEffectIfAvailable()` to `.glassEffect()`.


## License

SemiliquidGlass is available under the MIT license. See the [LICENSE](https://github.com/JanMensch/SemiliquidGlass/blob/main/LICENSE) file for more info.
