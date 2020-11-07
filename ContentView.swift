//
//  ContentView.swift
//  AnimationTest
//
//  Created by venrok on 07.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeneralView()
    }
}

struct GeneralView: View {
    
    var body: some View {
        GeometryReader { geometry in
            giveViewForBody(with: geometry.size)
        }
    }
    
    func giveViewForBody(with size: CGSize) -> some View {
        ZStack {
            drawCircles(size: size)
            Button(action: {
                self.moveBack.toggle()
            }) {
                Text("Move rectangles")
            }.padding(50)
        }
    }
    
    let cardW: CGFloat = 110
    let cardH: CGFloat = 150
    
    @State private var moveBack = true
    
    let animationPeriod = 1.0
    
    func drawCircles(times: Int = 3, size: CGSize) -> some View {
        ForEach(0..<times) { index in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: cardW, height: cardH)
                .rotation3DEffect(Angle.degrees(moveBack ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                //.rotationModifier(width: cardW, height: cardH, isFaceUp: !moveBack)
                .position(x: cardW/3, y: cardH/3)
                .offset(x: moveBack ? 0 : CGFloat(Int.random(in: Int(cardW)...Int(size.width-100))),
                        y: moveBack ? 0 : CGFloat(Int.random(in: 50...Int(size.height-50))))
                .animation(Animation.easeIn(duration: animationPeriod).delay(animationPeriod * Double(index)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

