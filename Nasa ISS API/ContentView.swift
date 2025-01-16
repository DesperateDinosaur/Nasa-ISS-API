//
//  ContentView.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    private var pages: [Page] = [
        Page(pageID: PageIDs.all, title: "All", icon: "questionmark.circle"),
        Page(pageID: PageIDs.climate, title: "Climate and Tanks", icon: "thermometer.medium"),
        Page(pageID: PageIDs.usAttitude, title: "US Attitude", icon: "angle"),
        Page(pageID: PageIDs.cmg, title: "Control Moment Gyroscope", icon: "gyroscope"),
        Page(pageID: PageIDs.bands, title: "Bands", icon: "antenna.radiowaves.left.and.right")
    ]

    var body: some View {
        NavigationSplitView {
            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
                
                ForEach(pages) { page in
                    NavigationLink {
                        Text("This is a page for " + page.title + " data!")
                    } label: {
                        Image(systemName: page.icon).symbolRenderingMode(.palette)
                            .foregroundStyle(.primary, Color.accentColor)
                        Text(page.title)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: appInfo) {
                        Label("Add Item", systemImage: "questionmark.circle")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func appInfo() {
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
