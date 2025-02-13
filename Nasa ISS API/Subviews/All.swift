//
//  All.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI

struct All: View {
    var body: some View {
        VStack {
            Climate()
            Spacer()
                .frame(height: 75)
            USAttitude()
            Spacer()
                .frame(height: 75)
            CMG()
            Spacer()
                .frame(height: 75)
            Bands()
        }
        .frame(maxWidth: .infinity)
    }
}
