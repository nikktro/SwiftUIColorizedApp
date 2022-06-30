//
//  ColorView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 30.06.2022.
//

import SwiftUI

struct ColorView: View {
    let color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(height: 120)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 4))
            .padding()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .purple)
    }
}
