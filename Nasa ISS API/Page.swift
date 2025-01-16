//
//  Pages.swift
//  Nasa ISS API
//
//  Created by Gabriel Internoscia on 2025-01-15.
//

import Foundation
import SwiftUICore

// Enum to store an event type
enum PageIDs {
    case all, climate, usAttitude, cmg, bands
}

struct Page: Identifiable {
    var id = UUID()
    var pageID: PageIDs
    var title: String
    var icon: Image
    
    init(pageID: PageIDs, title: String, icon: Image) {
        self.pageID = pageID
        self.title = title
        self.icon = icon
    }
}
