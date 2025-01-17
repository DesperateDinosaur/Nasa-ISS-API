//
//  Angle.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI

struct Angle: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 25)
//            .fill(.regularMaterial)
//            .frame(width: 150, height: 150)
        VStack{
            Text("Hello")
        }
        .background(.regularMaterial)
        .frame(width: 150, height: 150)
        .clipShape(.rect(cornerSize: CGSize(width: 25, height: 25)))
    }
}
