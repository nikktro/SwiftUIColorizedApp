//
//  ColorSliderView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 30.06.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var colorValue: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(colorValue))")
                .foregroundColor(.white)
                .frame(width: 32)
            
            Slider(value: $colorValue, in: 0...255, step: 1)
                .tint(tintColor)
            
            TextField("", value: $colorValue, formatter: NumberFormatter())
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .padding([.horizontal], 4)
                .frame(width: 50, height: 30)
                .background(Color.white)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white))
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(colorValue: .constant(123), tintColor: .purple)
    }
}
