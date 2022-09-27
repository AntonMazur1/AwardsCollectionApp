//
//  CoinAwardView.swift
//  AwardsCollectionApp
//
//  Created by Клоун on 27.09.2022.
//

import SwiftUI

struct CoinAwardView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                let size = min(width, height)
                let middle = size / 2
                let nearLine = size * 0.1
                let farLine = size * 0.9
                
                let path = Path { path in
                    path.move(to: CGPoint(x: middle - height * 0.2, y: nearLine))
                    path.addLine(to: CGPoint(x: middle + height * 0.2, y: nearLine))
                    path.addLine(to: CGPoint(x: farLine, y: middle))
                    path.addLine(to: CGPoint(x: middle + height * 0.2, y: farLine))
                    path.addLine(to: CGPoint(x: middle - height * 0.2, y: farLine))
                    path.addLine(to: CGPoint(x: nearLine, y: middle))
                    path.closeSubpath()
                }
                path
                    .fill(Color(.yellow))
                    .overlay(path.stroke(.purple, lineWidth: 5))
            }
            Image("eagle")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(radius: 10)
        }
    }
}

struct CoinAwardView_Previews: PreviewProvider {
    static var previews: some View {
        CoinAwardView()
            .frame(width: 200, height: 200)
    }
}
