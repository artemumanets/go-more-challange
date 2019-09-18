import UIKit
import SDWebImage

class PersonCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentStack.addArrangedSubview(nameLabel)
        contentStack.addArrangedSubview(ageLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(contentStack)
        makeConstraints()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.sd_cancelCurrentImageLoad()
        profileImageView.image = UIImage.placeholder
    }

    private func makeConstraints() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            profileImageView.heightAnchor.constraint(equalToConstant: 32.0),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 3.0/4.0),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor,
                                                      multiplier: 1.0),
            profileImageView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: contentView.topAnchor,
                                                  multiplier: 1.0),

            contentStack.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: contentView.topAnchor,
                                              multiplier: 1),
            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentStack.leadingAnchor.constraint(equalToSystemSpacingAfter: profileImageView.trailingAnchor,
                                                  multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStack.trailingAnchor,
                                                  multiplier: 1)
            ])
    }

    func configure(with person: Person, isSorted: Bool) {
        nameLabel.attributedText = person.fullName(highlightSortValue: isSorted, baseFont: nameLabel.font)
        ageLabel.text = person.age.map { "Age: \($0)" }
        ageLabel.isHidden = person.age == nil
        let adjustedMargin = ageLabel.isHidden ? directionalLayoutMargins.top * 1.5 : directionalLayoutMargins.top
        contentView.directionalLayoutMargins.top = adjustedMargin
        contentView.directionalLayoutMargins.bottom = adjustedMargin

        profileImageView.sd_setImage(with: person.profilePicture,
                                     placeholderImage: UIImage.placeholder,
                                     options: [.avoidAutoSetImage]) { [weak self] (image, error, _, _) in

                                        if let image = image, error == nil {
                                            self?.profileImageView.image = image
                                        }
        }
    }

    private let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        return profileImageView
    }()

    private let contentStack: UIStackView = {
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        return contentStack
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        return nameLabel
    }()

    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        ageLabel.textColor = .lightGray
        return ageLabel
    }()
}

// MARK: - Model
private extension Person {
    var fullName: String {
        return [firstName, lastName].compactMap({ $0}).joined(separator: " ")
    }

    func fullName(highlightSortValue: Bool, baseFont: UIFont) -> NSAttributedString {
        let attributedStr = NSMutableAttributedString(string: fullName, attributes: [.font: baseFont.regular])
        if highlightSortValue, let range = fullName.range(of: sortableName) {
            let highlightRange = NSRange(range, in: fullName)
            attributedStr.addAttributes([.font: baseFont.bold], range: highlightRange)
        }
        return attributedStr
    }
}
