//
//  ContentView.swift
//  ColorPicker
//
//  Created by Nikolay Trofimov on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        
        ZStack {
            Color(red: 44 / 255, green: 96 / 255, blue: 185 / 255)
                .ignoresSafeArea()
            
            VStack {
                ColorView(red: red, green: green, blue: blue)
                    .padding([.top, .bottom], 16)
                
                ColorSliderView(sliderValue: $red, tintColor: .red)
                ColorSliderView(sliderValue: $green, tintColor: .green)
                ColorSliderView(sliderValue: $blue, tintColor: .blue)
                Spacer()
            }
            .padding()
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
