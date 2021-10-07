//
//  ContentView.swift
//  Bullseye
//
//  Created by Anthony Carrasco on 9/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO ")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
            Text("89")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .font(.body)
                    .bold()
                Slider(value: self.$sliderValue, in:
                        1.0...100.0)
                Text("100")
                    .font(.body)
                    .bold()
            }
            Button(action: {
                print("Hello, SwiftUI")
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Hello there"), message: Text("The slide's value is \(self.sliderValue)."), dismissButton: .default(Text("Testing!")))
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
            
        Group {
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
