import UIKit

extension UILabel {

    /// Use for Big titles. For example at launch screen
    public static func BigTitleLabel(with text: String, color: UIColor = .white, rows: Int) -> UILabel {
        let lb: UILabel = {
            let lb = UILabel()
            lb.font = UIFont(name: "PlusJakartaSans-Bold", size: 68)
            lb.text = text
            lb.textColor = color
            lb.numberOfLines = rows
            lb.textAlignment = .center
            return lb
        }()
        return lb
    }
    
    /// Use for scene Header Labels.
    public static func sectionTitleLabel(with text: String, color: UIColor = .white, rows: Int) -> UILabel {
        let lb: UILabel = {
            let lb = UILabel()
            lb.font = UIFont(name: "PlusJakartaSans-SemiBold", size: 30)
            lb.text = text
            lb.textColor = color
            lb.numberOfLines = rows
            lb.textAlignment = .left
            return lb
        }()
        return lb
    }
    
    /// Use for Section names ect.
    public static func elementsTitleLabel(with text: String, color: UIColor = .white, rows: Int) -> UILabel {
        let lb: UILabel = {
            let lb = UILabel()
            lb.font = UIFont(name: "PlusJakartaSans-Medium", size: 22)
            lb.text = text
            lb.textColor = color
            lb.numberOfLines = rows
            lb.textAlignment = .center
            return lb
        }()
        return lb
    }
    
    /// Use for User expiriance. Probably needed for user interaction for video custimizaton.
    public static func customTitles(with text: String, color: UIColor, size: CGFloat, weight: VideoTitleFontsStyles, alpha: CGFloat) -> UILabel {
        let lb = UILabel()
        lb.text = text
        lb.textColor = color
        lb.font = UIFont(name: weight.rawValue, size: size)
        lb.numberOfLines = 0
        lb.alpha = alpha
        return lb
    }
    
    /// User for inactive labels. For exapmle names of parameters / time durations / subtitles for items. Mostly right side placed labels
    public static func smallDarkGrayLabels(with text: String, rows: Int) -> UILabel {
        let lb: UILabel = {
            let lb = UILabel()
            lb.font = UIFont(name: "PlusJakartaSans-Regular", size: 12)
            lb.text = text
            lb.textColor = .init(hex: 0x606060)
            lb.numberOfLines = rows
            lb.textAlignment = .center
            return lb
        }()
        return lb
    }
    
    /// User for active labels. For exapmle names of parameters / time durations / subtitles for items. Mostly left side placed labels. White color alwayes
    public static func labelsWhite(with text: String, rows: Int) -> UILabel {
        let lb: UILabel = {
            let lb = UILabel()
            lb.font = UIFont(name: "PlusJakartaSans-Regular", size: 12)
            lb.text = text
            lb.textColor = .white
            lb.numberOfLines = rows
            lb.textAlignment = .center
            return lb
        }()
        return lb
    }
    
    /// Use for titles up to alert views / segment controls ect.
    public static func seccondaryTitleLabel(with text: String, color: UIColor, alpha: CGFloat) -> UILabel {
        let lb = UILabel()
        lb.text = text
        lb.textColor = color
        lb.alpha = alpha
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont(name: "PlusJakartaSans-Bold", size: 14)
        return lb
    }
    
    /// Returns gradiented text label with Orage-Purple colors
    func setGradientedText() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.init(hex: 0xFFB951),
                                UIColor.init(hex: 0xCE50E0)].map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.type = .axial
        
        // Создаем маску для применения градиента только к тексту
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            guard let cgImage = image?.cgImage else { return }
            
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
            guard let newContext = UIGraphicsGetCurrentContext() else { return }
            newContext.clip(to: bounds, mask: cgImage)
            gradientLayer.render(in: newContext)
            
            let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            textColor = UIColor(patternImage: gradientImage ?? UIImage())
        }
    }
}

public enum VideoTitleFontsStyles: String {
    case regular = "PlusJakartaSans-Regular"
    case extraLight = "PlusJakartaSans-ExtraLight"
    case italic = "PlusJakartaSans-Italic"
    case light = "PlusJakartaSans-Light"
    case medium = "PlusJakartaSans-Medium"
    case semi_Bold = "PlusJakartaSans-SemiBold"
    case bold = "PlusJakartaSans-Bold"
    case extraBold = "PlusJakartaSans-ExtraBold"
}
