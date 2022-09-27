//
//  CartRacingView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 20.05.2022.
//

import SwiftUI

struct CartRacingView: View {
    @State private var start = false
    
    var body: some View {
        HStack {
            VStack(spacing: 10){
                CartView(
                    start: $start,
                    cartTitle: "Default",
                    color: .red,
                    animation: .default
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseOut",
                    color: .green,
                    animation: .easeOut(duration: 0.7)
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseIn",
                    color: .yellow,
                    animation: .easeIn(duration: 0.7)
                )
                CartView(
                    start: $start,
                    cartTitle: "EaseInOut",
                    color: .blue,
                    animation: .easeInOut(duration: 0.7).repeatCount(
                        3,
                        autoreverses: true
                    )
                )
                CartView(
                    start: $start,
                    cartTitle: "InterpolationSpring",
                    color: .brown,
                    animation: .interpolatingSpring(
                        mass: 1,
                        stiffness: 100,
                        damping: 10,
                        initialVelocity: 0
                    )
                    .delay(0.2)
                )
                CartView(
                    start: $start,
                    cartTitle: "Spring",
                    color: .orange,
                    animation: .spring(
                        response: 0.55,
                        dampingFraction: 0.45,
                        blendDuration: 0
                    )
                    .speed(0.5)
                )
            }
            Spacer()
        }
        .onTapGesture {
            start.toggle()
        }
    }
}

struct CartRacingView_Previews: PreviewProvider {
    static var previews: some View {
        CartRacingView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct CartView: View {
    @Binding var start: Bool
    
    let cartTitle: String
    let color: Color
    let animation: Animation
    
    var body: some View {
        VStack {
            Image(systemName: "cart.fill")
                .font(.title)
                .foregroundColor(color)
                .offset(x: start ? UIScreen.main.bounds.width - 200 : 0)
                .animation(animation, value: start)
            Text(cartTitle)
        }
    }
}
