//
//  TransformAnimated.swift
//
//  Animated
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

/// A container that animates any view based on the given non-animatable data.
/// - Parameters:
///   - value: Data that animate.
///   - transform: A closure that transforms the non-animatable data to animatable ones.
///   - revert: A closure that transform the animatable data back to the non-animatable ones.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func TransformAnimated<V, A: VectorArithmetic, Content: View>(_ value: V,
                                                                     transform: @escaping (V) -> A,
                                                                     revert: @escaping (A, V) -> V,
                                                                     @ViewBuilder content: @escaping (V) -> Content) -> some View {
    Color.clear.modifier(TransformableValueModifier(value: value,
                                                    content: content,
                                                    aToV: revert,
                                                    vToA: transform))
}

/// A container that animates any view based on the given non-animatable data.
/// - Parameters:
///   - value: Data that animate.
///   - transform: A closure that transforms the non-animatable data to animatable ones.
///   - revert: A closure that transform the animatable data back to the non-animatable ones.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func TransformAnimated<V, A: Animatable, Content: View>(_ value: V,
                                                                     transform: @escaping (V) -> A,
                                                                     revert: @escaping (A, V) -> V,
                                                                     @ViewBuilder content: @escaping (V) -> Content) -> some View {
    Color.clear.modifier(TransformableAnimatableValueModifier(value: value,
                                                    content: content,
                                                    aToV: revert,
                                                    vToA: transform))
}

/// A container that animates any view based on the given non-animatable data.
/// - Parameters:
///   - value: Data that animate.
///   - transform: A closure that transforms the non-animatable data to animatable ones.
///   - revert: A closure that transform the animatable data back to the non-animatable ones.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func TransformAnimated<V, A: VectorArithmetic, Content: View>(_ binding: Binding<V>,
                                                                     transform: @escaping (V) -> A,
                                                                     revert: @escaping (A, V) -> V,
                                                                     @ViewBuilder content: @escaping (Binding<V>) -> Content) -> some View {
    Color.clear.modifier(TransformableBindingModifier(binding: binding,
                                                      content: content,
                                                      aToV: revert,
                                                      vToA: transform))
}

/// A container that animates any view based on the given non-animatable data.
/// - Parameters:
///   - value: Data that animate.
///   - transform: A closure that transforms the non-animatable data to animatable ones.
///   - revert: A closure that transform the animatable data back to the non-animatable ones.
///   - content: A view builder that creates the content to animate.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public func TransformAnimated<V, A: Animatable, Content: View>(_ binding: Binding<V>,
                                                                     transform: @escaping (V) -> A,
                                                                     revert: @escaping (A, V) -> V,
                                                                     @ViewBuilder content: @escaping (Binding<V>) -> Content) -> some View {
    Color.clear.modifier(TransformableAnimatableBindingModifier(binding: binding,
                                                      content: content,
                                                      aToV: revert,
                                                      vToA: transform))
}
