//
//  SemiGlass.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 15.08.25.
//

import SwiftUI

/// This type makes it possible to refer to a "potentially existing" `Glass` effect without needing to worry about availability checks yourself.
public struct SemiGlass: Equatable, Sendable, SendableMetatype {

    // MARK: - Supporting types

    /// Maps the `Glass` types by Apple to an enum.
    public enum SemiGlassType: Equatable, Sendable, SendableMetatype {
        /// Maps to `Glass.clear`.
        /// - SeeAlso: https://developer.apple.com/documentation/swiftui/glass/clear
        case clear

        /// Maps to `Glass.identity`
        /// SeeAlso: https://developer.apple.com/documentation/swiftui/glass/identity
        case identity

        /// Maps to `Glass.regular`
        /// SeeAlso: https://developer.apple.com/documentation/swiftui/glass/regular
        case regular
    }

    // MARK: - Properties

    private let glassType: SemiGlassType
    private let interactive: Bool?
    private let tint: Color?

    // MARK: - Glass variants

    /// Use instead of `Glass.clear`.
    static public let clear = SemiGlass(glassType: .clear, interactive: nil, tint: nil)

    /// Use instead of `Glass.identity`
    static public let identity = SemiGlass(glassType: .identity, interactive: nil, tint: nil)

    /// Use instead of `Glass.regular`
    static public let regular = SemiGlass(glassType: .regular, interactive: nil, tint: nil)

    // MARK: - Init

    private init(glassType: SemiGlassType, interactive: Bool?, tint: Color?) {
        self.glassType = glassType
        self.interactive = interactive
        self.tint = tint
    }

    // MARK: - Mirror definitions for Apples methods on `Glass`

    /// Mirrors Apples `Glass.interactive()` function.
    /// - Parameter isEnabled: Defines whether this `SemiGlass` material should be interactive, not interactive or use the default (when `nil`).
    /// - Returns a copy of the structure configured to be interactive.
    public func interactive(_ isEnabled: Bool? = true) -> SemiGlass {
        return .init(glassType: glassType, interactive: isEnabled, tint: tint)
    }

    /// Mirrors Apples `Glass.tint()` function.
    /// - Parameter tint: The tint color to set.
    /// - Returns a copy of the structure with a configured tint color.
    public func tint(_ tint: Color?) -> SemiGlass {
        return .init(glassType: glassType, interactive: interactive, tint: tint)
    }

    // MARK: - Mapping to Apple's `Glass` instance

    /// Maps a `SemiGlass` to an actual iOS 26+ `Glass` enum instance.
    /// - Returns: The `Glass` material with the identical name, with the correct tint and interactivity setting.
    @available(iOS 26, *)
    public var mappedToAppleGlass: Glass {
        switch self.glassType {
        case .clear:
            return .clear.tint(tint).optionalInteractive(interactive)
        case .identity:
            return .identity.tint(tint).optionalInteractive(interactive)
        case .regular:
            return .regular.tint(tint).optionalInteractive(interactive)
        }
    }
}

#Preview {
    @Previewable @State var isExpanded = false
    @Previewable @Namespace var glassNamespace

    SemiGlassEffectContainer(spacing: 20.0) {
        HStack(spacing: 20.0) {
            Image(systemName: "scribble.variable")
                .frame(width: 80.0, height: 80.0)
                .font(.system(size: 36))
                .glassEffectIfAvailable(.regular)
                .glassEffectIDIfAvailable("pencil", in: glassNamespace)
                .noGlassAvailable {
                    $0.background(Color.gray.opacity(0.5).clipShape(.circle))
                }


            if isExpanded {
                Image(systemName: "eraser.fill")
                    .frame(width: 80.0, height: 80.0)
                    .font(.system(size: 36))
                    .glassEffectIfAvailable(.regular.tint(.orange))
                    .glassEffectIDIfAvailable("eraser", in: glassNamespace)
                    .noGlassAvailable {
                        $0.background(Color.orange.opacity(0.5).clipShape(.circle))
                    }
            }
        }
    }
    .animation(.default, value: isExpanded)


    Button("Toggle") {
        isExpanded.toggle()
    }
}
