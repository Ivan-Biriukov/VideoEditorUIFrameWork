// MARK: - Imports

import UIKit

// MARK: - BaseViewController

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(hex: 0x030303)
    }
    
    func addSubviews(from views: [UIView], to parentView: UIView) {
       views.forEach({parentView.addSubview($0)})
   }
    
}

