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
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        
        ZStack {
            Color(red: 44 / 255, green: 96 / 255, blue: 185 / 255)
                .ignoresSafeArea()
            
            VStack {
                ColorView(red: red, green: green, blue: blue)
                    .padding([.top, .bottom], 16)
                
                ColorSliderView(sliderValue: $red, tintColor: .red)
                    .focused($focusedField, equals: .red)
                ColorSliderView(sliderValue: $green, tintColor: .green)
                    .focused($focusedField, equals: .green)
                ColorSliderView(sliderValue: $blue, tintColor: .blue)
                    .focused($focusedField, equals: .blue)
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup (placement: .keyboard) {
                    Button(action: previousField) {
                        Image(systemName: "chevron.up")
                    }
                    Button(action: nextField) {
                        Image(systemName: "chevron.down")
                    }
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
        .onTapGesture {
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
}

extension ContentView {
    enum Field {
        case red
        case green
        case blue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
