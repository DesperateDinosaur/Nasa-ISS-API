//
//  Climate.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI

public struct Climate: View {
    public var body: some View {
        VStack (alignment: .leading){
            Text("Cooling Fluid Temp (Node 2) [°C]")
                .font(.title2)
            Grid{
                GridRow{
                    Temperature()
                    Spacer()
                        .frame(width: 15)
                    Temperature()
                }
            }
            Spacer()
                .frame(height: 50)
            Text("Cooling Fluid Temp (Node 3) [°C]")
                .font(.title2)
            Grid{
                GridRow{
                    Temperature()
                    Spacer()
                        .frame(width: 15)
                    Temperature()
                }
            }
            Spacer()
                .frame(height: 50)
            Text("Tanks")
                .font(.title2)
            Grid{
                GridRow{
                    Percentage()
                    Spacer()
                        .frame(width: 15)
                    Percentage()
                    Spacer()
                        .frame(width: 15)
                    Percentage()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
