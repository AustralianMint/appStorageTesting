//
//  ContentView.swift
//  testingUserDefaults
//
//  Created by Thomas Frey on 22.03.23.
//

import SwiftUI

//Style guide for how buttons look
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 40)
            .padding(.vertical, 50)
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .buttonStyle(.borderless)
    }
}

//defining Gradient color for background
let backgroundGradient = LinearGradient(
    colors: [Color.accentColor, Color.white],
    startPoint: .top,
    endPoint: .bottom)

struct ContentView: View {
    @AppStorage ("tapCount") private var tapCount = 0
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                Text("\(tapCount)")
                    .font(.system(size: 200))
                    .fontWeight(.bold)
                    
                HStack {
                    Button("Minus") {
                        tapCount -= 1
                    }
                    .buttonStyle(BlueButton())
                    
                    Spacer()
                    
                    Button("Plus") {
                        tapCount += 1
                    }
                    .buttonStyle(BlueButton())
                }
                .padding()
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
