//
//  Nasa_ISS_APIApp.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-15.
//

import SwiftUI
import SwiftData

@main
struct Nasa_ISS_APIApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandGroup(replacing: CommandGroupPlacement.newItem) {
            }
        }
        .modelContainer(sharedModelContainer)
        
        Window("About", id: "about") {
            Text("Made by Gabriel Internoscia")
        }
    }
}
