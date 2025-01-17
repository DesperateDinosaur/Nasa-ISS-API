//
//  Temperature.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI

struct Temperature: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 25)
//            .fill(.regularMaterial)
//            .frame(width: 150, height: 150)
        VStack {
            Text("Hello")
        }
        .frame(width: 145, height: 145)
//        .background(.regularMaterial)
        .background(Color.red)
        .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
    }
}
