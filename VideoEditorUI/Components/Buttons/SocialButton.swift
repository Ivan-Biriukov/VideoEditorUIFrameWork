// MARK: - Imports

import UIKit

// MARK: - SocialButtonDelegate

public protocol SocialButtonDelegate {
    func didTaped()
}

// MARK: - ButtonStyles

public enum ButtonStyle: String {
    case tikTok = "Sign in with Tiktok"
    case gMail = "Sign in with Gmail"
    case faceBook = "Sign in with Facebook"
    case apple = "Continue with Apple"
    case email = "Continue with Email"
}

private enum Appierance {
    static let cornerRadius: CGFloat = 10
    static let borderWidth: CGFloat = 0.5
    static let borderColor: CGColor = UIColor.white.cgColor
}

// MARK: - SocialButton

public class SocialButton: UIButton {

// MARK: - Properties
    
    private let bStyle: ButtonStyle
    var delegate: SocialButtonDelegate?
    
    // MARK: - Init
    
    public init(bStyle: ButtonStyle) {
        self.bStyle = bStyle
        super.init(frame: .zero)
        configure(with: bStyle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension SocialButton {
    
    func configure(with style: ButtonStyle) {
        setTitle(style.rawValue, for: .normal)
        titleLabel?.font = .signInButtonsFont()
        setTitleColor(.white, for: .normal)
        backgroundColor = .commonBackground()
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layer.cornerRadius = Appierance.cornerRadius
        layer.borderWidth = Appierance.borderWidth
        layer.borderColor = Appierance.borderColor
        
        addTarget(self, action: #selector(didTaped), for: .touchUpInside)
        sizeToFit()
        
        switch style {
        case .tikTok:
            setImage(.tiktokIcon(), for: .normal)
        case .gMail:
            setImage(.googleIcon(), for: .normal)
        case .faceBook:
            setImage(.faceBookIcon(), for: .normal)
        case .apple:
            setImage(.appleIcon(), for: .normal)
        case .email:
            setImage(.emailIcon(), for: .normal)
        }
    }
}

// MARK: - Targets

private extension SocialButton {
    @objc func didTaped() {
        delegate?.didTaped()
    }
}
