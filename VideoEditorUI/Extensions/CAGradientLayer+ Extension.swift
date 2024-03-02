import UIKit

extension CAGradientLayer {
    
    // MARK: - Buttons backgrounds
    
    /// Use for purchases buttons or when you wanna make an actient buttons
    static func fromOgangeToPuprle() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.init(hex: 0xFFB951),
            UIColor.init(hex: 0xCE50E0)
        ]
        gradient.locations = [0,1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        return gradient
    }
    
    // MARK: - PopUp views
    
    static func videoSettingsPopUp() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor.init(hex: 0x1F1F1F, alpha: 0.85),
            UIColor.init(hex: 0x1F1F1F, alpha: 1)
        ]
        gradient.locations = [0,1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        return gradient
    }
}
