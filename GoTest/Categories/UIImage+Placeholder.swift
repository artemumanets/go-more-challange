import UIKit

extension UIImage {
    static let placeholder: UIImage = {
        return UIGraphicsImageRenderer(size: .placeholder).image { context in
            UIColor.black.setStroke()
            context.cgContext.strokeEllipse(in: CGRect.placeholderCenter.insetBy(dx: 4, dy: 4))
            context.cgContext.stroke(CGRect.placeholderOutline.insetBy(dx: 1, dy: 1))
        }.withRenderingMode(.alwaysTemplate)
    }()
}

private extension CGFloat {
    static let placeholderHeight: CGFloat = 32
}

private extension CGSize {
    static var placeholder: CGSize {
        let height = CGFloat.placeholderHeight
        let width = height / 3 * 4
        return CGSize(width: width, height: height)
    }
}

private extension CGRect {
    static var placeholderOutline: CGRect {
        return CGRect(origin: .zero, size: .placeholder)
    }
    static var placeholderCenter: CGRect {
        let side = CGFloat.placeholderHeight
        return CGRect(x: (CGSize.placeholder.width - side) / 2,
                      y: (CGSize.placeholder.height - side) / 2,
                      width: side,
                      height: side)
    }
}
