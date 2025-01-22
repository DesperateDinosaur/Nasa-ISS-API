//
//  Percentage.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-16.
//

import Foundation
import SwiftUI
import AppKit
import Cocoa

struct Percentage: View {
    var percent: Double
    
    var body: some View {
        VStack {
            ZStack {
                // grey background circle
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(Color(NSColor.systemGray))

                // green base circle to receive shadow
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.percent, 0.5)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(NSColor.systemGreen))
                    .rotationEffect(.degrees(270.0))

                // point with shadow, clipped
                Circle()
                    .trim(from: CGFloat(abs((min(percent, 1.0))-0.001)), to: CGFloat(abs((min(percent, 1.0))-0.0005)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(NSColor.blue))
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                    .rotationEffect(.degrees(270.0))
                    .clipShape(
                        Circle().stroke(lineWidth: 10)
                    )
                
                // green overlay circle to hide shadow on one side
                Circle()
                    .trim(from: percent > 0.5 ? 0.25 : 0, to: CGFloat(min(self.percent, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(NSColor.systemGreen))
                    .rotationEffect(.degrees(270.0))
            }
            .padding()
            
            Text("Hello")
                .padding(.bottom)
        }
        .frame(width: 145, height: 145)
        .background(.regularMaterial)
//        .background(Color.red)
        .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
    }
}
