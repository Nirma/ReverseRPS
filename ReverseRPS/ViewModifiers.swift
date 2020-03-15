//
//  ViewModifiers.swift
//  ReverseRPS
//
//  Created by Nicholas Maccharoli on 2020/03/15.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI

struct PillButton: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        return content
            .font(Font.bold(.body)())
            .accentColor(Color.white)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .background(Color.yellow)
            .clipShape(Capsule())
    }
}

extension View {
    func pillButton(width: CGFloat = 100, height: CGFloat = 44.0) -> some View {
        return self.modifier(PillButton(width: width, height: height))
    }
}
