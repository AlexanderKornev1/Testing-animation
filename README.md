Такой вариант работает как нужно, карта движется к своему месту на экране и вращается. Но с обоих сторон она одинаковая

    RoundedRectangle(cornerRadius: 10)  
                .fill(Color.green)
                .frame(width: cardW, height: cardH)
                
                .rotation3DEffect(Angle.degrees(moveBack ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                //.rotationModifier(width: cardW, height: cardH, isFaceUp: !moveBack)
                
                .position(x: cardW/3, y: cardH/3)
                .offset(x: moveBack ? 0 : CGFloat(Int.random(in: Int(cardW)...Int(size.width-100))),
                        y: moveBack ? 0 : CGFloat(Int.random(in: 50...Int(size.height-50))))
                .animation(Animation.easeIn(duration: animationPeriod).delay(animationPeriod * Double(index)))
                
Если использовать модификатор с той же анимацией rotation3DEffect, то карты перестают вращаться в движении, а делают это уже после своего расположения. 

    RoundedRectangle(cornerRadius: 10)  
                .fill(Color.green)
                .frame(width: cardW, height: cardH)
                
                //.rotation3DEffect(Angle.degrees(moveBack ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                .rotationModifier(width: cardW, height: cardH, isFaceUp: !moveBack)
                
                .position(x: cardW/3, y: cardH/3)
                .offset(x: moveBack ? 0 : CGFloat(Int.random(in: Int(cardW)...Int(size.width-100))),
                        y: moveBack ? 0 : CGFloat(Int.random(in: 50...Int(size.height-50))))
                .animation(Animation.easeIn(duration: animationPeriod).delay(animationPeriod * Double(index)))

