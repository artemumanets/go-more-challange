//
//  PeopleViewModel.swift
//  GoTest
//
//  Created by Artem Umanets on 21/08/2019.
//  Copyright © 2019 GoMore. All rights reserved.
//

import Foundation
import UIKit

class PeopleViewModel {

    private(set) var sectionData = [SectionData]()

    init(people: [Person]) {

        let peopleGroups = Dictionary(grouping: people, by: { $0.sortableName.firstLetter })
        let keys = people.sorted { $0.sortableName < $1.sortableName }.map { $0.sortableName.firstLetter }.unique()

        let peopleSections = keys.map { identifier -> PeopleSection in
            let peopleGroup = peopleGroups[identifier]?.sorted { $0.sortableName < $1.sortableName } ?? []
            let sectionEntry = PeopleSectionEntry(sectionLetter: identifier, people: peopleGroup)
            return PeopleSection(peopleSection: sectionEntry)
        }
        sectionData.append(contentsOf: peopleSections)
    }
}

// MARK: - Section Management
private struct PeopleSectionEntry {

    let sectionLetter: String
    let people: [Person]
}

private class PeopleSection: SectionData {

    var people: [Person]
    var title: String
    var count: Int { return people.count }

    init(peopleSection: PeopleSectionEntry) {
        self.title = peopleSection.sectionLetter
        self.people = peopleSection.people
    }

    func cell(from tableView: UITableView, forRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonCell = tableView.reusableCell(for: indexPath)
        cell.configure(with: people[indexPath.row], isSorted: true)
        return cell
    }
}
