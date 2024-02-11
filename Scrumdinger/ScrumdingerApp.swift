//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by loratech on 11/02/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData )
        }
    }
}
