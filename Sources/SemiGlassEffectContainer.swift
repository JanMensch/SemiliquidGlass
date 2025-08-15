//
//  SemiGlassEffectContainer.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 15.08.25.
//

import SwiftUI

/// Makes `GlassEffectContainer` usable on pre Liquid Glass OSs without availability checks.
/// Provides fallback variant content to display if client does not support Liquid Glass.
/// Optionally allows to display same content for both cases (if Liquid Glass is available or not).
public struct SemiGlassEffectContainer<Content: View, FallbackContent: View>: View, Sendable, SendableMetatype {

    // MARK: - Properties

    /// The spacing to apply for `GlassEffectContainer`. Controls the merging effect of `Glass` items.
    /// Will be passed directly to the `GlassEffectContainer`.
    let spacing: CGFloat?

    /// The content to display in the `SemiGlassEffectContainer`.
    /// Will be passed directly to `GlassEffectContainer`.
    let content: Content

    /// The content to display in the `SemiGlassEffectContainer`.
    /// Content to display if OS does not support Liquid Glass.
    let fallbackContent: FallbackContent

    // MARK: - Inits

    /// A view that shows a [`GlassEffectContainer`](https://developer.apple.com/documentation/swiftui/glasseffectcontainer) with the given parameters, if Liquid Glass is available on the client.
    /// Otherwise `fallbackContent` will get presented.
    /// - Parameter spacing: Controls the merging effect of Liquid Glass. Refer to Apple's documentation for details.
    /// - Parameter content: The content to show in the `GlassEffectContainer`.
    /// - Parameter fallbackContent: The content to show if client does not support Liquid Glass.
    public init(
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder fallbackContent: () -> FallbackContent,
    ) {
        self.spacing = spacing
        self.content = content()
        self.fallbackContent = fallbackContent()
    }

    /// A view that shows a [`GlassEffectContainer`](https://developer.apple.com/documentation/swiftui/glasseffectcontainer) with the given parameters, if Liquid Glass is available on the client.
    /// Otherwise `fallbackContent` will get presented.
    /// - Parameter spacing: Controls the merging effect of Liquid Glass. Refer to Apple's documentation for details.
    /// - Parameter content: The content to show. If Liquid Glass is supported, this content will be placed in a `GlassEffectContainer`. Otherwise the content will be shown directly.
    public init(
        spacing: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) where FallbackContent == Content {
        self.spacing = spacing
        self.content = content()
        self.fallbackContent = content()
    }

    public var body: some View {
        if #available(iOS 26, *) {
            GlassEffectContainer(spacing: spacing) {
                content
            }
        } else {
            fallbackContent
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        Text("Container with different content for pre liquid glass content:")
        SemiGlassEffectContainer {
            HStack {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
            }
        } fallbackContent: {
            HStack {
                Button(action: {}) {
                    Image(systemName: "square.and.pencil.circle")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up.circle")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
            }
        }
        .padding(.bottom)

        Text("Container with same content for pre liquid glass content:")

        SemiGlassEffectContainer {
            HStack {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
            }
        }
        .padding(.bottom)

        Text("Demo usage with spacing:")

        SemiGlassEffectContainer(spacing: 40) {
            HStack(spacing: 0) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                }
                .glassEffectIfAvailable()
            }
        }
    }
    .padding()

}
