//
//  View+IfLiquidGlassAvailable.swift
//  SemiliquidGlass
//
//  Created by Jan Oskar Mensch on 15.08.25.
//

import SwiftUI

public extension View {

    /// Apply modifiers to this view *if* Liquid Glass is available.
    /// Do nothing if client is running a pre Liquid Glass OS.
    /// - Parameter transform: Closure that gets this view passed in.
    ///
    /// Usage example:
    /// ````
    ///     someView
    ///         .whenGlassAvailable {
    ///             $0.padding()
    ///         }
    /// ````
    @ViewBuilder
    func whenGlassAvailable(transform: (Self) -> some View) -> some View {
        if SemiGlass.liquidGlassSupported {
            transform(self)
        } else {
            self
        }
    }

    /// Apply modifiers to this view if Liquid Glass is *not* available.
    /// Do nothing if client is running an OS that supports Liquid Glass.
    /// - Parameter transform: Closure that gets this view passed in.
    ///
    /// Usage example:
    /// ````
    ///     someView
    ///         .noGlassAvailable {
    ///             $0.background(Color.orange)
    ///         }
    /// ````
    @ViewBuilder
    func noGlassAvailable(transform: (Self) -> some View) -> some View {
        if !SemiGlass.liquidGlassSupported {
            transform(self)
        } else {
            self
        }
    }
}
