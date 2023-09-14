//
//  ContentView.swift
//  Calculator
//
//  Created by Macbook Air on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Spacer()
                        Text("0")
                            .bold()
                            .font(.system(size:52))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
