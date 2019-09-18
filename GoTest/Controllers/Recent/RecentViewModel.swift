//
//  RecentViewModel.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

class RecentViewModel {

    private(set) var sectionData = [SectionData]()

    init(events: [Event], people: [Person]) {

        let eventsSubset = Array(events.prefix(Constant.recentEventsCount))
        let peopleSubset = Array(people.prefix(Constant.recentPeopleCount))
        if eventsSubset.count > 0 {
            sectionData.append(RecentEventSection(events: eventsSubset))
        }
        if peopleSubset.count > 0 {
            sectionData.append(RecentPeopleSection(people: peopleSubset))
        }
    }
}

// MARK: - Section Management
private class RecentEventSection: SectionData {

    var events: [Event]
    var title: String
    var count: Int { return events.count }

    init(events: [Event]) {
        self.title = "Events"
        self.events = events
    }

    func cell(from tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventCell = tableView.reusableCell(for: indexPath)
        cell.configure(with: events[indexPath.row])
        return cell
    }
}

private class RecentPeopleSection: SectionData {

    var people: [Person]
    var title: String
    var count: Int { return people.count }

    init(people: [Person]) {
        self.title = "People"
        self.people = people
    }

    func cell(from tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: PersonCell = tableView.reusableCell(for: indexPath)
        cell.configure(with: people[indexPath.row], isSorted: false)
        return cell
    }
}

// MARK: - Utils
private enum Constant {

    static let recentEventsCount: Int = 10
    static let recentPeopleCount: Int = 10
}
