//
//  Button+SemiliquidGlass.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 22.08.25.
//

import SwiftUI

public extension Button {

    /// Applies `.buttonStyle(.glass)` if available.
    /// If not available, this button stays unmodified. Please apply custom fallback via `.noGlassAvailable(transform:)`.
    ///
    /// For behavior documentation refer to Apple's documentation:
    /// [`.glass`](https://developer.apple.com/documentation/swiftui/glassbuttonstyle)
    ///
    /// When migrating away from this library, please replace the call site with `.buttonStyle(.glass)`.
    @MainActor
    func glassButtonStyleIfAvailable() -> some View {
        if #available(iOS 26.0, tvOS 26.0, watchOS 26.0, macOS 26.0, *) {
            return self.buttonStyle(.glass)
        } else {
            return self
        }
    }

    /// Applies `.buttonStyle(.glassProminent)` if available.
    /// If not available, this button stays unmodified. Please apply custom fallback via `.noGlassAvailable(transform:)`.
    ///
    /// For behavior documentation refer to Apple's documentation:
    /// [`.glassProminent`](https://developer.apple.com/documentation/swiftui/glassprominentbuttonstyle)
    ///
    /// When migrating away from this library, please replace the call site with `.buttonStyle(.glassProminent)`.
    @MainActor
    func prominentGlassButtonStyleIfAvailable() -> some View {
        if #available(iOS 26.0, tvOS 26.0, watchOS 26.0, macOS 26.0, *) {
            return self.buttonStyle(.glassProminent)
        } else {
            return self
        }
    }
}

#Preview {
    Button(action: {}) {
        Image(systemName: "pencil.circle")
        Text("A glass button")
    }
    .glassButtonStyleIfAvailable()

    Button(action: {}) {
        Image(systemName: "pencil.circle")
        Text("A prominent glass button with manual .borderedProminent fallback")
    }
    .prominentGlassButtonStyleIfAvailable()
    .noGlassAvailable { $0.buttonStyle(.borderedProminent) }
}
