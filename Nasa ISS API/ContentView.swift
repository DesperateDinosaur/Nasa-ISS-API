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
    @Environment(\.sidebarRowSize) private var sidebarRowSize
    
    @State private var sidebarSize: CGFloat = 250
    @Query private var items: [Item]
    
    private var pages: [Page] = [
        Page(pageID: PageIDs.all, title: "All", icon: Image(systemName: "questionmark.circle")),
        Page(pageID: PageIDs.climate, title: "Climate and Tanks", icon: Image(systemName: "thermometer.medium")),
        Page(pageID: PageIDs.usAttitude, title: "US Attitude", icon: Image("custom.angle")),
        Page(pageID: PageIDs.cmg, title: "Control Moment Gyroscope", icon: Image("custom.gyroscope")),
        Page(pageID: PageIDs.bands, title: "Bands", icon: Image(systemName: "antenna.radiowaves.left.and.right"))
    ]
    
    init() {
        print("initializing")
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(pages) { page in
                    NavigationLink {
                        ScrollView {
                            switch page.pageID {
                            case PageIDs.all:
                                All()
                            case PageIDs.climate:
                                Climate()
                            case PageIDs.usAttitude:
                                USAttitude()
                            case PageIDs.cmg:
                                CMG()
                            case PageIDs.bands:
                                Bands()
                            default:
                                Startup()
                            }
                        }
                        .frame(alignment: .leading)
                        .navigationTitle(page.title)
                    } label: {
                        page.icon.symbolRenderingMode(.palette)
                            .foregroundStyle(.primary, Color.accentColor)
                            .frame(maxWidth: 18)
                            .font(.system(size: 18))
                        Text(page.title)
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: sidebarSize, ideal: sidebarSize, max: sidebarSize)
            .onChange(of: sidebarRowSize, {
                adjustSidebar()
            })
            .toolbar {
                ToolbarItem {
                    Button(action: appInfo) {
                        Label("About", systemImage: "questionmark.circle")
                    }
                }
            }
        } detail: {
            Startup()
        }
        .onAppear {
            adjustSidebar()
        }
    }
    
    private func appInfo() {
        withAnimation {
            openWindow(id: "about")
        }
    }
    
    private func adjustSidebar() {
                switch sidebarRowSize {
                case SidebarRowSize.small:
                    sidebarSize = 205
                case SidebarRowSize.medium:
                    sidebarSize = 225
                case SidebarRowSize.large:
                    sidebarSize = 250
                default:
                    sidebarSize = 250
                }
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
