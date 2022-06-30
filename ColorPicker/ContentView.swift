//
//  ContentView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    var body: some View {
        let constructedColor = Color(red: redValue / 255,
                               green: greenValue / 255,
                               blue: blueValue / 255)
        
        ZStack {
            Color(red: 44 / 255, green: 96 / 255, blue: 185 / 255)
                .ignoresSafeArea()
            
            VStack {
                ColorView(color: constructedColor)
                
                ColorSliderView(colorValue: $redValue, tintColor: .red)
                ColorSliderView(colorValue: $greenValue, tintColor: .green)
                ColorSliderView(colorValue: $blueValue, tintColor: .blue)
                
            }
            .padding(.top, -250)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture{
            hideKeyboard()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
