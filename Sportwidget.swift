import WidgetKit
import SwiftUI

struct SportEntry: TimelineEntry {
    let date: Date
    let headlines: [String]
}

struct SportProvider: TimelineProvider {
    func placeholder(in context: Context) -> SportEntry {
        SportEntry(date: Date(), headlines: ["NU.nl Sportnieuws"])
    }

    func getSnapshot(in context: Context, completion: @escaping (SportEntry) -> Void) {
        completion(SportEntry(date: Date(), headlines: ["Voetbal", "Formule 1", "Wielrennen"]))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SportEntry>) -> Void) {
        let entry = SportEntry(
            date: Date(),
            headlines: ["NU.nl Sportnieuws", "Voetbal", "Formule 1", "Wielrennen"]
        )
        completion(Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(900))))
    }
}

struct SportWidgetView: View {
    var entry: SportEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("NU.nl SPORT")
                .font(.headline)
            ForEach(entry.headlines, id: \.self) { headline in
                Text(headline)
                    .font(.caption)
            }
        }
        .padding()
    }
}
