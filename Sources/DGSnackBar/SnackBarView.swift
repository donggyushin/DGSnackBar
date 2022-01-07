//
//  SnackBarView.swift
//  DGSnackBarExample
//
//  Created by 신동규 on 2022/01/07.
//
import UIKit

class SnackBarView: UIView {
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = descriptionString
        view.numberOfLines = 4
        view.textColor = textColor
        view.textAlignment = textAlignment
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [descriptionLabel])
        view.axis = .vertical
        return view
    }()
    
    private let descriptionString: String
    private let textColor: UIColor
    private let textAlignment: NSTextAlignment
    private let _backgroundColor: UIColor
    private let _alpha: CGFloat
    private let duration: CGFloat
    private let cornerRadius: CGFloat
    
    init(descriptionString: String, backgroundColor: UIColor = .label, textColor: UIColor = UIColor.systemBackground, duration: CGFloat = 2.5, textAlignment: NSTextAlignment = .natural, alpha: CGFloat = 1, cornerRadius: CGFloat = 10) {
        self.descriptionString = descriptionString
        self.textColor = textColor
        self.textAlignment = textAlignment
        self._backgroundColor = backgroundColor
        self._alpha = alpha
        self.duration = duration
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        alpha = _alpha
        backgroundColor = _backgroundColor
        transform = .init(translationX: 0, y: 200)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        present()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.hide()
        }
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
