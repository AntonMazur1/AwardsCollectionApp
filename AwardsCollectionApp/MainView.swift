//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(awardIsShowing ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(awardIsShowing ? 2 : 1)
                        .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                }
            }
            Spacer()
            if awardIsShowing {
                CoinAwardView()
                    .frame(width: 250, height: 250)
                    .transition(.flip)
            }
            Spacer()
            
            Image("chest")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.3)
                .rotationEffect(Angle(degrees: 15))
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation() {
            awardIsShowing.toggle()
        }
    }
}

struct RotationViewModifier: ViewModifier {
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
            .offset(
                x: 0,
                y: rotation != 0 ? UIScreen.main.bounds.height + UIScreen.main.bounds.height * 0.1 : 0
            )
            .scaleEffect(rotation != 0 ? 0.4 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension AnyTransition {
    static var flip: AnyTransition {
        AnyTransition.modifier(
            active: RotationViewModifier(rotation: 360),
            identity: RotationViewModifier(rotation: 0)
        )
    }
}
