//
//  DetailView.swift
//  Scrumdinger
//
//  Created by loratech on 11/02/24.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    @State private var isPresentingEditView: Bool = false
    
    var body: some View {
        List {
            Section("Meeting Info") {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(scrum.theme.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(5)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
                
            }
            
            Section("Attendees") {
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name,systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit"){
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done"){
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        })
    }
}

#Preview {
    DetailView(scrum: DailyScrum.sampleData[0])
}
