
import SwiftUI

struct RotationModifier: AnimatableModifier {
    
    var rotation: Double
    
    var w: CGFloat
    var h: CGFloat
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRaduius)
                    //.stroke(lineWidth: edgeLineWidth)
                    .frame(width: w, height: h)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRaduius)
                .fill(Color.red)
                .opacity(isFaceUp ? 0 : 1)
                .frame(width: w, height: h)//
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    init(width: CGFloat, height: CGFloat, isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.w = width//
        self.h = height//
    }
    
    // MARK: - Constants
    private let cornerRaduius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 7
}

extension View {
    func rotationModifier(width: CGFloat, height: CGFloat, isFaceUp: Bool) -> some View {
        self.modifier(RotationModifier(width: width, height: height, isFaceUp: !isFaceUp))
    }
}

