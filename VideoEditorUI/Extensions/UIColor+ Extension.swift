import UIKit

extension UIColor {
    
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    // MARK: - Buttons Backgrounds
    
    public static func commonBackground() -> UIColor {
        return UIColor(hex: 0x1F1F1F)
    }
    
    public static func blackBackground() -> UIColor {
        return .black
    }
    
    public static func videoEffectBackground() -> UIColor {
        return .init(hex: 0x808080)
    }
    
    public static func flowLifestyleBackground() -> UIColor {
        return .init(hex: 0x43418E)
    }
    
    public static func colorOverlayBackground() -> UIColor {
        return .init(hex: 0xD158D9)
    }
    
    public static func musicLayerBackground() -> UIColor {
        return .init(hex: 0xE86F48)
    }
    
}
