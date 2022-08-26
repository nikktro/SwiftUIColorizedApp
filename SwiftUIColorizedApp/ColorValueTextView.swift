//
//  ColorValueTextView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 11.07.2022.
//

import SwiftUI

struct ColorValueTextView: View {
    
    let colorValue: Double
    
    var body: some View {
        Text("\(lround(colorValue))")
            .foregroundColor(.white)
            .frame(width: 32)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTextView(colorValue: 12)
        }
    }
}
