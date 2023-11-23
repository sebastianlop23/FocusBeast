//
//  SwipeToUnlockView.swift
//  SwipeToConfirm
//
//  Created by Martin Bjeld on 17/05/2020.
//  Copyright © 2020 Martin Bjeld. All rights reserved.
//

import SwiftUI


extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize:CGSize {
        return CGSize(width: 60, height: 70) // Adjusted for vertical orientation
    }
    
    static var activeThumbSize:CGSize {
        return CGSize(width: 60, height: 85) // Adjusted for vertical orientation
    }
    
    static var trackSize:CGSize {
        return CGSize(width: 60, height: 280) // Adjusted for vertical orientation
    }
}

extension SwipeToUnlockView {
    func onSwipeSuccess(_ action: @escaping () -> Void ) -> Self {
        var this = self
        this.actionSuccess = action
        return this
    }
}


struct SwipeToUnlockView: View {
    @Environment(\.colorScheme) var colorScheme
    
    // we want to animate the thumb size when user starts dragging (swipe)
    @State private var thumbSize:CGSize = CGSize.inactiveThumbSize
    
    // we need to keep track of the dragging value. Initially its zero
    @State private var dragOffset:CGSize = .zero
    
    // Lets also keep track of when enough was swiped
    @State private var isEnough = false
    
    // Actions
    private var actionSuccess: (() -> Void )?
    
    
    // The track does not change size
    let trackSize = CGSize.trackSize
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: trackSize.width, height: trackSize.height)
                //.foregroundColor(Color.black).blendMode(.overlay).opacity(0.5)
                .foregroundColor(colorScheme == .dark ? .black : .white).opacity(0.5)
            
            //text
            Text("GO")
                .font(.caption)
                .foregroundColor(Color.white)
                .offset(x: 0, y: 30) // Adjusted for vertical orientation
                .opacity(Double(1 - ( (self.dragOffset.height*2)/self.trackSize.height ))) // Adjusted for vertical orientation
            
            //Thumb
            ZStack {
                Capsule()
                    .frame(width: thumbSize.width, height: thumbSize.height)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                
                Image(systemName: "arrow.down") // Changed to down arrow
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            .offset(x: 0, y: getDragOffsetY()) // Adjusted for vertical orientation
            .animation(Animation.spring(response: 0.3, dampingFraction: 0.8))
            .gesture(
                DragGesture()
                    .onChanged({ value in self.handleDragChanged(value) })
                    .onEnded({ _ in self.handleDragEnded() })
            )
        }
    }
    
    // MARK: - Haptic feedback
    private func indicateCanLiftFinger() -> Void {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    private func indicateSwipeWasSuccessful() -> Void {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    
    // MARK: - Helpers
    private func getDragOffsetY() -> CGFloat {
        let clampedDragOffsetY = dragOffset.height.clamp(lower: 0, trackSize.height - thumbSize.height)
        return -(trackSize.height/2 - thumbSize.height/2 - clampedDragOffsetY)
    }
    
    // MARK: - Gesture Handlers
    private func handleDragChanged(_ value:DragGesture.Value) -> Void {
        self.dragOffset = value.translation
        
        let dragHeight = value.translation.height
        let targetDragHeight = self.trackSize.height - (self.thumbSize.height*2)
        let wasInitiated = dragHeight > 2
        let didReachTarget = dragHeight > targetDragHeight
        
        self.thumbSize = wasInitiated ? CGSize.activeThumbSize : CGSize.inactiveThumbSize
        
        if didReachTarget {
            if !self.isEnough {
                self.indicateCanLiftFinger()
            }
            self.isEnough = true
        } else {
            self.isEnough = false
        }
    }
    
    private func handleDragEnded() -> Void {
        // If enough was dragged, complete swipe
        if self.isEnough {
            self.dragOffset = CGSize(width: 0, height: self.trackSize.height - self.thumbSize.height)
            
            // the outside world should be able to know
            if nil != self.actionSuccess {
                self.indicateSwipeWasSuccessful()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.actionSuccess!()
                }
            }
        } else {
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
        }
    }
}

struct SwipeToUnlockView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
