//
//  Bage.swift
//  Landmarks
//
//  Created by Jerry Lin on 9/5/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct Bage: View {
    
    static let rotationCount = 8
    
    var badgeSymbols : some View {
        ForEach(0 ..< Bage.rotationCount) { i in
            RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(Bage.rotationCount) * 360.0))
        }.opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0/4.0,anchor: .top)
                    .position(x: geometry.size.width/2.0,y: (3.0/4.0) * geometry.size.height)
            }
        }.scaledToFit()
    }
}

struct Bage_Previews: PreviewProvider {
    static var previews: some View {
        Bage()
    }
}
