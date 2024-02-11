//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by loratech on 11/02/24.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        .init(title: "Design", attendees: ["Cathy", "Daisy", "Tim", "Jonathan","Simon"], lengthInMinutes: 10, theme: .yellow),
        .init(title: "Developer", attendees: ["Cathy", "Daisy", "Tim",], lengthInMinutes: 20, theme: .orange),
        .init(title: "AI Engineer", attendees: ["Tim", "Jonathan","Simon"], lengthInMinutes: 15, theme: .poppy)
    ]
}
