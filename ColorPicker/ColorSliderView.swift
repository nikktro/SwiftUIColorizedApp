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
            colorLabel(colorValue: colorValue)
            
            Slider(value: $colorValue, in: 0...255, step: 1)
                .tint(tintColor)
            
            colorTextField(colorValue: $colorValue)
        }
    }
}

struct colorLabel: View {
    let colorValue: Double
    
    var body: some View {
        Text("\(lround(colorValue))")
            .foregroundColor(.white)
            .frame(width: 32)
    }
}

struct colorTextField: View {
    @Binding var colorValue: Double
    
    var body: some View {
        TextField("", value: $colorValue, formatter: NumberFormatter())
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.trailing)
            .padding([.horizontal], 4)
            .frame(width: 50, height: 30)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white))
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(colorValue: .constant(123), tintColor: .purple)
    }
}
