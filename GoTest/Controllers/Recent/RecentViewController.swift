import UIKit

class RecentViewController: UITableViewController {

    private let viewModel: RecentViewModel

    init(events: [Event], people: [Person]) {
        self.viewModel = RecentViewModel(events: events, people: people)
        super.init(style: .grouped)

        title = "Recents"
        tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.defaultIdentifier)
        tableView.register(PersonCell.self, forCellReuseIdentifier: PersonCell.defaultIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension RecentViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {

        return viewModel.sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.sectionData[indexPath.section].cell(from: tableView, forRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionData[section].title
    }
}
