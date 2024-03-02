// MARK: - Imports

import UIKit

// MARK: - SocialButtonDelegate

public protocol SubscriptionButtonDelegate {
    func didTaped()
}

// MARK: - ButtonStyles

public enum SubscriptionButtonStyle {
    case free
    case premium
}

private enum Appierance {
    static let cornerRadius: CGFloat = 10
}

// MARK: - SocialButton

public class SubscriptionButton: UIButton {

// MARK: - Properties
    
    private let bStyle: SubscriptionButtonStyle
    var delegate: SubscriptionButton?
    
    // MARK: - Init
    
    public init(bStyle: SubscriptionButtonStyle) {
        self.bStyle = bStyle
        super.init(frame: .zero)
        configure(with: bStyle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension SubscriptionButton {
    
    func configure(with style: SubscriptionButtonStyle) {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = Appierance.cornerRadius
        addTarget(self, action: #selector(didTaped), for: .touchUpInside)
        
        switch style {
        case .free:
            titleLabel?.font = .trialButtonFont()
            setTitle("Free trial / 7 days", for: .normal)
            backgroundColor = .commonBackground()
            
        case .premium:
            titleLabel?.font = .premiumButtonFont()
            setTitle("Subscribe / 8,99 weekly", for: .normal)
            setupGradientBG()
        }
    }
    
    private func setupGradientBG() {
        let gradient = CAGradientLayer.fromOgangeToPuprle()
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Targets

private extension SubscriptionButton {
    
    @objc func didTaped() {
        delegate?.didTaped()
    }
}
