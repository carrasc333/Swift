//
//  SwiftUIView.swift
//  Bullseye
//
//  Created by Anthony Carrasco on 10/23/21.
//

import SwiftUI

struct InsructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .padding(.leading,30.0)
      .padding(.trailing,30.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width:35.0)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .kerning(1.5)
      .font(.caption)
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .font(.callout)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        RoundedRectangle(cornerRadius: 12.0)
          .fill(Color.accentColor)
      )
      .foregroundColor(.white)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InsructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "99")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
    }
    .padding()
  }
}
