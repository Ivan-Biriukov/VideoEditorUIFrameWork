import UIKit

extension UIButton {
    
    func leftPadding(value: CGFloat, button: UIButton) {
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: value).isActive = true
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    }
}
