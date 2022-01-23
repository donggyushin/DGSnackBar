import UIKit

public class DGSnackBar {
    public static let shared = DGSnackBar()
    
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    public var backgroundColor: UIColor = .black
    public var textColor: UIColor = UIColor.white
    public var duration: CGFloat = 2.5
    public var textAlignment: NSTextAlignment = .natural
    public var titleTextAlignment: NSTextAlignment = .natural
    public var alpha: CGFloat = 0.8
    public var cornerRadius: CGFloat = 10
    
    private var snackBarView: SnackBarView?
    private var keyboardHeight: CGFloat = 0
    private var isKeyboardPresent = false
    
    public func showToast(_ description: String, _ title: String? = nil, action: (() -> Void)? = nil) {
        
        var window: UIWindow?
        if #available(iOS 13, *) {
            window = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene) }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow })
        } else {
            window = UIApplication.shared.keyWindow
        }
        guard let window = window else { return }

        let snackBarView = SnackBarView(descriptionString: description, titleString: title, backgroundColor: backgroundColor, textColor: textColor, duration: duration, textAlignment: textAlignment, titleTextAlignment: titleTextAlignment, alpha: alpha, cornerRadius: cornerRadius, action: action)
        self.snackBarView = snackBarView
        window.subviews.compactMap({ $0 as? SnackBarView }).forEach({ $0.hideFading() })
        window.addSubview(snackBarView)
        snackBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            snackBarView.bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: -10 - keyboardHeight),
            snackBarView.leftAnchor.constraint(equalTo: window.leftAnchor, constant: 20),
            snackBarView.rightAnchor.constraint(equalTo: window.rightAnchor, constant: -20)
        ])
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if !self.isKeyboardPresent { return }
        snackBarView?.frame.origin.y += keyboardHeight
        self.keyboardHeight = 0
        self.isKeyboardPresent = false
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if self.isKeyboardPresent { return }
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.keyboardHeight = keyboardHeight
            self.snackBarView?.frame.origin.y -= keyboardHeight
            self.isKeyboardPresent = true
        }
    }
}
