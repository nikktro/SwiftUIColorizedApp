//
//  ColorValueTFView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 11.07.2022.
//

import SwiftUI

struct ColorValueTFView: View {
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

struct ColorValueTFView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTFView(textValue: .constant("123"), value: .constant(123))
        }
    }
}
