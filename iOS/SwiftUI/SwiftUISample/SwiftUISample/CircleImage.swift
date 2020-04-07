//
//  CircleImage.swift
//  SwiftUISample
//
//  Created by Anshad R on 16/01/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("place")
            .frame(height: 200)
            .clipShape(Circle())
            .overlay(Circle()
            .stroke(Color.white,lineWidth: 5))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
