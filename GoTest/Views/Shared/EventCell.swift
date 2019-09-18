import UIKit

class EventCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentStack.addArrangedSubview(nameLabel)
        contentStack.addArrangedSubview(timeLabel)
        contentView.addSubview(contentStack)
        makeConstraints()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeConstraints() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: contentView.topAnchor,
                                              multiplier: 1),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStack.trailingAnchor,
                                                  multiplier: 1)
            ])
    }

    func configure(with event: Event) {
        nameLabel.text = event.name
        timeLabel.text = DateFormatter.shortDateFormatter.string(from: event.date)
    }

    private let contentStack: UIStackView = {
        let contentStack = UIStackView()
        contentStack.alignment = .center
        contentStack.spacing = UIStackView.spacingUseSystem
        return contentStack
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        return nameLabel
    }()

    private let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        timeLabel.textColor = .lightGray
        return timeLabel
    }()
}

private extension DateFormatter {
    static let shortDateFormatter: DateFormatter = {
        let shortDateFormatter = DateFormatter()
        shortDateFormatter.dateFormat = NSString.localizedStringWithFormat("d MMM, yyyy") as String
        return shortDateFormatter
    }()
}
