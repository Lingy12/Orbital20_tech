//
//  LongPressDemoView.swift
//  SwiftUIGestures
//
//  Created by Simon Ng on 3/12/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct LongPressDemoView: View {
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    
    var body: some View {
        Image(systemName: "star.circle.fill")
        .font(.system(size: 200))
        .opacity(longPressTap ? 0.4 : 1.0)
        .scaleEffect(isPressed ? 0.5 : 1.0)
        .animation(.easeInOut)
        .foregroundColor(.green)
        .gesture(
            LongPressGesture(minimumDuration: 1.0)
                .updating($longPressTap, body: { (currentState, state, transaction) in
                    state = currentState
                })
                .onEnded({ _ in
                    self.isPressed.toggle()
                })
        )
    }
}

struct LongPressDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressDemoView()
    }
}
