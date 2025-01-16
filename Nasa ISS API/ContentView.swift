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
    @Environment(\.openWindow) private var openWindow
    @Query private var items: [Item]
    
    private var pages: [Page] = [
        Page(pageID: PageIDs.all, title: "All", icon: Image(systemName: "questionmark.circle")),
        Page(pageID: PageIDs.climate, title: "Climate and Tanks", icon: Image(systemName: "thermometer.medium")),
        Page(pageID: PageIDs.usAttitude, title: "US Attitude", icon: Image("custom.angle")),
        Page(pageID: PageIDs.cmg, title: "Control Moment Gyroscope", icon: Image("custom.gyroscope")),
        Page(pageID: PageIDs.bands, title: "Bands", icon: Image(systemName: "antenna.radiowaves.left.and.right"))
    ]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(pages) { page in
                    NavigationLink {
                        Text("This is a page for " + page.title + " data!")
                    } label: {
                        HStack(alignment: .center){
                            page.icon.symbolRenderingMode(.palette)
                                .foregroundStyle(.primary, Color.accentColor)
                        }.frame(maxWidth: 10)
                        Text(page.title)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200, max: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: appInfo) {
                        Label("About", systemImage: "questionmark.circle")
                    }
                }
            }
        } detail: {
            Image(systemName: "playstation.logo")
        }
    }
    
    private func appInfo() {
        openWindow(id: "about")
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
