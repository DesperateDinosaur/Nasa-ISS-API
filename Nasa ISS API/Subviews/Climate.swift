//
//  Climate.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI

public struct Climate: View {
    
    private var node2_temps = [53.3, 43.5]
    private var node3_temps = [22.9, 35.6]
    private var tank_percents = [45.0, 55.1, 82.7]
    
    public var body: some View {
        VStack (alignment: .leading){
            Text("Cooling Fluid Temp (Node 2) [°C]")
                .font(.title2)
            
            FlowLayout{
                ForEach(0..<node2_temps.count, id: \.self) { temp in
                    Temperature(temp: Double(temp))
                    Spacer()
                        .frame(width: 15)
                }
            }
            
            Spacer()
                .frame(height: 50)
            
            Text("Cooling Fluid Temp (Node 3) [°C]")
                .font(.title2)
            
            FlowLayout{
                ForEach(0..<node3_temps.count, id: \.self) { temp in
                    Temperature(temp: Double(temp))
                    Spacer()
                        .frame(width: 15)
                }
            }
            
            Spacer()
                .frame(height: 50)
            
            Text("Tanks")
                .font(.title2)
            
            FlowLayout{
                ForEach(tank_percents, id: \.self) { percent in
                    Percentage(percent: percent)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15))
                }
//                for percent in tank_percents {
//                    Percentage(percent: percent)
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15))
//                }
//                tank_percents.forEach { percent in
//                    Percentage(percent: percent)
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15))
//                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
