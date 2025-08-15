//
//  View+SemiliquidGlass.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 15.08.25.
//

import SwiftUI

public extension View {

    /// Applies original `.glassEffect()` if it's available.
    /// Parameters are forwarded directly. For behavior documentation refer to Apple's documentation:
    /// [`.glassEffect()`](https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:))
    ///
    /// If it is not available, this view does not get modified.
    /// - Parameter glass: A `SemiGlass` case that gets mapped to a `Glass` case if possible.
    /// - Parameter shape: A `Shape` to apply for this glass effect. Defaults to `Capsule()`.
    @ViewBuilder
    func glassEffectIfAvailable(
        _ glass: SemiGlass = .regular,
        in shape: some Shape = Capsule()
    ) -> some View {
        if #available(iOS 26, *) {
            self
                .glassEffect(glass.mappedToAppleGlass, in: shape)
        } else {
            self
        }
    }

    /// Applies original `.glassEffectID()` if it's available.
    /// Parameters are forwarded directly. For behavior documentation refer to Apple's documentation:
    /// [`.glassEffectID()`](https://developer.apple.com/documentation/swiftui/view/glasseffectid(_:in:))
    ///
    /// If it is not available, this view does not get modified.
    @ViewBuilder
    func glassEffectIDIfAvailable(
        _ id: (some Hashable & Sendable)?,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 26, *) {
            self
                .glassEffectID(id, in: namespace)
        } else {
            self
        }
    }

}
