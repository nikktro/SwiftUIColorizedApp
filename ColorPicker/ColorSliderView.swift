//
//  ColorSliderView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 30.06.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let tintColor: Color
    
    var body: some View {
        HStack {
            colorLabel(colorValue: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(tintColor)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = String(lround(sliderValue))
                }
            
            colorTextField(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = String(lround(sliderValue))
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
    @Binding var textValue: String
    @Binding var value: Double
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            checkValue()
        }
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.trailing)
            .padding([.horizontal], 4)
            .frame(width: 50, height: 30)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white))
    }
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        value = 0
        textValue = "0"
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(sliderValue: .constant(123), tintColor: .purple)
    }
}
