// MARK: - Imports

import UIKit

// MARK: - ButtonStyles

public enum SystemButtonsStyle {
    case edit
    case home
    case share
    case playPause
    case backward
    case forward
    case scale
    case addEffect
    case music
    case voice
    case text
    case effect
    case overlay
    case ratio
    case closeInactive
    case closeActive
    case muteUnmute
    case leftAligment
    case centerAligment
    case rightAligment
}

// MARK: - Appierance

private enum Appierance {
    static let editHight: CGFloat = 40
    static let editWIdth: CGFloat = 80
    static let editCornerRadius: CGFloat = 25
    
    static let homeButtonSizes: CGFloat = 24
    static let shareButtonSize: CGFloat = 24
    
    static let playPauseSizes: CGFloat = 40
    static let playPauseCornerRadius: CGFloat = 20
    static let scaleSize: CGFloat = 40
    static let scaleButtonCornerRadius: CGFloat = 20
    
    static let remoteButtonsSizes: CGFloat = 10
    static let effectsMenuButtonsSizes: CGFloat = 24
    static let addEffectButtonCornerRadius: CGFloat = 12
    
    static let muteButtonSizes: CGFloat = 19
    
    static let aligmentWidth: CGFloat = 18
    static let aligmentHeight: CGFloat = 14
}

// MARK: - SocialButton

public class SystemButtons: UIButton {

// MARK: - Properties
    
    private let bStyle: SystemButtonsStyle
    var onTap: (() -> Void)?
    
    private var isPlaying: Bool = false
    private var isMuted: Bool = false
    
    // MARK: - Init
    
    public init(bStyle: SystemButtonsStyle) {
        self.bStyle = bStyle
        super.init(frame: .zero)
        configure(with: bStyle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension SystemButtons {
    
    func configure(with style: SystemButtonsStyle) {
        
        addTarget(self, action: #selector(didTaped), for: .touchUpInside)
        
        switch style {
        case .edit:
            backgroundColor = .black
            layer.cornerRadius = Appierance.editCornerRadius
            self.widthAnchor.constraint(equalToConstant: Appierance.editWIdth).isActive = true
            self.heightAnchor.constraint(equalToConstant: Appierance.editHight).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            setTitle("Edit", for: .normal)
            setTitleColor(.white, for: .normal)
            
        case .home:
            setImage(.homeIconImage(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.homeButtonSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.homeButtonSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .share:
            setImage(.shareIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.shareButtonSize).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.shareButtonSize).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .playPause:
            isPlaying ? setImage(.playButtonIcon(), for: .normal) : setImage(.pauseButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.playPauseSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.playPauseSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            layer.cornerRadius = Appierance.playPauseCornerRadius
            addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
            
        case .backward:
            setImage(.backwardIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.remoteButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.remoteButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .forward:
            setImage(.forwardIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.remoteButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.remoteButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .scale:
            setImage(.scaleButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.scaleSize).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.scaleSize).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.cornerRadius = Appierance.scaleButtonCornerRadius
            contentMode = .scaleAspectFill
            
        case .addEffect:
            setImage(.addEffectsButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.cornerRadius = Appierance.addEffectButtonCornerRadius
            contentMode = .scaleAspectFill
            
        case .music:
            setImage(.musicButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .voice:
            setImage(.microButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .text:
            setImage(.textButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .effect:
            setImage(.visualEffectsIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .overlay:
            setImage(.overlayIconImage(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .ratio:
            setImage(.ratioIconImage(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .closeInactive:
            setImage(.closeInactiveIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .closeActive:
            setImage(.closeActiveIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.effectsMenuButtonsSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .muteUnmute:
            isMuted ? setImage(.muteButtonIcon(), for: .normal) : setImage(.unMuteButtonIcon(), for: .normal)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.muteButtonSizes).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.muteButtonSizes).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            addTarget(self, action: #selector(muteButtonTapped), for: .touchUpInside)
            
        case .leftAligment:
            setImage(.leftAligmentNormalIcon(), for: .normal)
            setImage(.leftAligmentSelectedIcon(), for: .selected)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.aligmentHeight).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.aligmentWidth).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .centerAligment:
            setImage(.centerAligmentNormalIcon(), for: .normal)
            setImage(.centerAligmentSelectedIcon(), for: .selected)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.aligmentHeight).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.aligmentWidth).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
            
        case .rightAligment:
            setImage(.rightAligmentNormalIcon(), for: .normal)
            setImage(.rightAligmentSelectedIcon(), for: .selected)
            backgroundColor = .clear
            setTitle(nil, for: .normal)
            self.heightAnchor.constraint(equalToConstant: Appierance.aligmentHeight).isActive = true
            self.widthAnchor.constraint(equalToConstant: Appierance.aligmentWidth).isActive = true
            self.translatesAutoresizingMaskIntoConstraints = false
            contentMode = .scaleAspectFill
        }
    }
}

// MARK: - Targets

private extension SystemButtons {
    @objc func didTaped() {
        onTap?()
    }
    
    @objc func playPauseButtonTapped() {
        isPlaying = !isPlaying
    }
    
    @objc func muteButtonTapped() {
        isMuted = !isMuted
    }
}
