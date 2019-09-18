import UIKit

class PeopleViewController: UITableViewController {
    private let viewModel: PeopleViewModel

    init(people: [Person]) {
        self.viewModel = PeopleViewModel(people: people)
        super.init(style: .plain)
        title = "Contacts"
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.defaultIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension PeopleViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionData[section].count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return UILocalizedIndexedCollation.current().sectionIndexTitles
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionData[section].title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.sectionData[indexPath.section].cell(from: tableView, forRowAt: indexPath)
    }
}
