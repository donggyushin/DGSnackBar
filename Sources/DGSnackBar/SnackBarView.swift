//
//  SnackBarView.swift
//  DGSnackBarExample
//
//  Created by 신동규 on 2022/01/07.
//
import UIKit

class SnackBarView: UIView {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = _backgroundColor
        view.alpha = _alpha
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = descriptionString
        view.numberOfLines = 4
        view.textColor = textColor
        view.textAlignment = textAlignment
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = titleString
        view.numberOfLines = 2
        view.textColor = textColor
        view.textAlignment = titleTextAlignment
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [descriptionLabel])
        if titleLabel.text?.isEmpty == false {
            view.insertArrangedSubview(titleLabel, at: 0)
        }
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    private let descriptionString: String
    private let titleString: String?
    private let textColor: UIColor
    private let textAlignment: NSTextAlignment
    private let titleTextAlignment: NSTextAlignment
    private let _backgroundColor: UIColor
    private let _alpha: CGFloat
    private let duration: CGFloat
    private let cornerRadius: CGFloat
    private lazy var tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
    private let action: (() -> Void)?
    
    init(descriptionString: String, titleString: String? = nil, backgroundColor: UIColor = .label, textColor: UIColor = UIColor.systemBackground, duration: CGFloat = 2.5, textAlignment: NSTextAlignment = .natural, titleTextAlignment: NSTextAlignment = .natural, alpha: CGFloat = 1, cornerRadius: CGFloat = 10, action: (() -> Void)? = nil) {
        self.descriptionString = descriptionString
        self.titleString = titleString
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.titleTextAlignment = titleTextAlignment
        self._backgroundColor = backgroundColor
        self._alpha = alpha
        self.duration = duration
        self.cornerRadius = cornerRadius
        self.action = action
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addGestureRecognizer(tap)
        
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        transform = .init(translationX: 0, y: 200)
        
        present()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.hide()
        }
    }
    
    @objc private func tapHandler(_ sender: UITapGestureRecognizer) {
        action?()
        hideFading()
    }
    
    private func present() {
        UIView.animate(withDuration: 0.4) {
            self.transform = .init(translationX: 0, y: 0)
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.4) {
            self.transform = .init(translationX: 0, y: 200)
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
    
    func hideFading() {
        UIView.animate(withDuration: 0.4) {
            self.alpha = 0
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
