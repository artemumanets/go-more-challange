import UIKit

class EventsViewController: UITableViewController {
    private let viewModel: EventsViewModel

    init(events: [Event]) {
        self.viewModel = EventsViewModel(events: events)
        super.init(style: .plain)
        title = "Events"
        tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.defaultIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension EventsViewController {

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
