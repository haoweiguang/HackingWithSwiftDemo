//
//  ContentView.swift
//  Animations
//
//  Created by 郝伟光 on 2024/6/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount=1.0
    
    var body: some View {
        Button("Tap Me"){
            animationAmount+=1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses:false),
                    value: animationAmount
                )
        )
        .onAppear(){
            animationAmount=2
        }
    }
}

struct AnimatedBindingsContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack{
            Stepper("Scale amount",value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3,autoreverses: true)
            ),in:1...10)
            Spacer()
            
            Button("Tap Me"){
                animationAmount+=1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}


struct ExplicitAnimationsContentView: View{
    @State private var animationAmount = 0.0
    
    var body: some View{
        Button("Tap me"){
            withAnimation {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
    }
}

#Preview {
    ExplicitAnimationsContentView()
}
