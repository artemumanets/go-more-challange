import UIKit

class MainViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setViewControllers([
            UINavigationController(largeTitleViewController: RecentViewController(events: [Event].allEvents,
                                                                                  people: [Person].allPeople)),
            UINavigationController(largeTitleViewController: EventsViewController(events: [Event].allEvents)),
            UINavigationController(largeTitleViewController: PeopleViewController(people: [Person].allPeople))
            ], animated: false)
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UINavigationController {
    convenience init(largeTitleViewController: UIViewController) {
        self.init(rootViewController: largeTitleViewController)
        navigationBar.prefersLargeTitles = true
    }
}
