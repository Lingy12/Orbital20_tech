//
//  DragDemoView.swift
//  SwiftUIGestures
//
//  Created by Simon Ng on 3/12/2019.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import SwiftUI

struct DragDemoView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .animation(.easeInOut)
            .foregroundColor(.green)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { (value, state, transaction) in
                        
                        state = value.translation
                    })
                    .onEnded({ (value) in
                        self.position.height += value.translation.height
                        self.position.width += value.translation.width
                    })
            )
    }
}

struct DragDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DragDemoView()
    }
}
