//
//  StarterView.swift
//  SwiftUIColorizedApp
//
//  Created by Nikolay Trofimov on 26.08.2022.
//

import SwiftUI

struct StarterView: View {
    @State private var swiftUIViewIsPresented = false
    @State private var uiKitViewIsPresented = false
    
    var body: some View {
        VStack {
            Button("SwiftUI View") {
                swiftUIViewIsPresented = true
            }
            .sheet(isPresented: $swiftUIViewIsPresented) {
                ContentView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
