//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Anshad R on 16/01/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Anshad")
                    .font(.title)
                HStack {
                    Text("National Park").font(.subheadline)
                    Spacer()
                    Text("Park").font(.subheadline)
                   
                }

            }.padding()
            Spacer()

        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
