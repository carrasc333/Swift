//
//  PointsView.swift
//  Bullseye
//
//  Created by Anthony Carrasco on 3/7/22.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var alertIsVisible: Bool
  @Binding  var sliderValue: Double
  @Binding  var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)

    VStack(spacing: 10) {
      InsructionText(text: "THE SLIDERS VALUE IS")
      BigNumberText(text: "89")
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      Button(action: {
        alertIsVisible = false
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Start New Round")
        }
      }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .shadow(radius: 10, x: 5, y: 5)
      }
}

struct PointsView_Previews: PreviewProvider {
  
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    Group {
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.light)
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.dark)
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.light)
        .previewLayout(.fixed(width: 568, height: 320))
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 568, height: 320))
    }
  }
}
