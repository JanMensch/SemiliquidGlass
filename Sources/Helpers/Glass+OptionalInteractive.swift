//
//  Glass+OptionalInteractive.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 15.08.25.
//

import SwiftUI

@available(iOS 26.0, tvOS 26.0, watchOS 26.0, macOS 26.0, *)
extension Glass {

    /// Optionally set interactivity on this `Glass` instance.
    /// If `nil` is set, this method returns an unmodified `self`.
    /// - Parameter isEnabled: Defines whether interactivity should be enabled on this `Glass` instance or not.
    ///     `nil` does nothing and keeps the current setting.
    /// - Returns the (potentially) modified Glass instance with the new interactivity setting.
    func optionalInteractive(_ isEnabled: Bool?) -> Glass {
        if let isEnabled {
            return self.interactive(isEnabled)
        } else {
            return self
        }
    }

}
