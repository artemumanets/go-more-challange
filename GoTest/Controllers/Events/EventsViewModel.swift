//
//  EventsViewModel.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

class EventsViewModel {

    private(set) var sectionData = [SectionData]()

    init(events: [Event]) {

        let eventsGroups = Dictionary(grouping: events, by: { $0.formattedDate })
        let keys = events.sorted { $0.date > $1.date }.map { $0.formattedDate }.unique()

        let eventsSections = keys.map { identifier -> EventsSection in
            let events = eventsGroups[identifier]?.sorted { $0.date < $1.date } ?? []
            let sectionEntry = EventsSectionEntry(title: identifier, events: events)
            return EventsSection(eventsSection: sectionEntry)
        }
        sectionData.append(contentsOf: eventsSections)
    }
}

// MARK: - Section Management
private struct EventsSectionEntry {

    let title: String
    let events: [Event]
}

private class EventsSection: SectionData {

    var events: [Event]
    var title: String
    var count: Int { return events.count }

    init(eventsSection: EventsSectionEntry) {
        self.title = eventsSection.title
        self.events = eventsSection.events
    }

    func cell(from tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventCell = tableView.reusableCell(for: indexPath)
        cell.configure(with: events[indexPath.row])
        return cell
    }
}

// MARK: - Model
private extension Event {

    var formattedDate: String {
        return DateFormatter.monthYearDateFormatter.string(from: self.date)
    }
}

// MARK: - Utils
private extension DateFormatter {

    static let monthYearDateFormatter: DateFormatter = {
        let monthYearDateFormatter = DateFormatter()
        monthYearDateFormatter.dateFormat = NSString.localizedStringWithFormat("MMM yyyy") as String
        return monthYearDateFormatter
    }()
}
