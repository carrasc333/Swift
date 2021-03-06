//
//  ContentView.swift
//  Bullseye
//
//  Created by Anthony Carrasco on 9/24/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
        HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  
  
  var body: some View {
    VStack {
      InsructionText(text:"🎯🎯🎯\nPut the Bullseye as Close as You Can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding  var sliderValue: Double
  @Binding  var game: Game
  
  
  var body: some View {
    Button(action: {
      withAnimation {
          alertIsVisible = true
      }
    }) {
      Text("Hit Me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .foregroundColor(Color.white)
    .cornerRadius(Constants.General.RoundRectCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.RoundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
//  ------Example of an alert in view------
//    .alert(isPresented: $alertIsVisible, content: {
//      let roundedValue = Int(sliderValue.rounded())
//      let points = game.points(sliderValue: roundedValue)
//      return Alert(title: Text("Hello there"), message: Text("The slide's value is \(roundedValue).\n" + "You scored \(points) points this round."), dismissButton: .default(Text("Awesome!")) {
//        game.startNewRound(points: points)
//      })
//    })
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.light)
      ContentView()
        .preferredColorScheme(.dark)
      ContentView()
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 568, height: 320))
      ContentView()
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 568, height: 320))
    }
  }
}
