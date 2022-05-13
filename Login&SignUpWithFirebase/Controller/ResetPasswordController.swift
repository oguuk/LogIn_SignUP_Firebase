//
//  ResetPasswordController.swift
//  Login&SignUpWithFirebase
//
//  Created by 오국원 on 2022/05/10.
//

import UIKit

protocol ResetPasswordControllerDelegate: class {
    func didSendResetPasswordLink()
}

class ResetPasswordController:UIViewController {
    //MARK: -Properties
    private var viewModel = ResetPasswordViewModel()
    var email: String?
    
    private let iconImage = UIImageView(image: #imageLiteral(resourceName: "firebase-logo"))
    private let emailTextField = CustomTextField(placeholder: "Email")
    weak var delegate: ResetPasswordControllerDelegate?
 
    
    private let resetPasswordButton: AuthButton = {
        let button = AuthButton()
        //addTarget은 #selector를 위해서
        button.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.title = "Send Reset Link"
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        //addTarget은 #selector를 위해서
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        return button
    }()
    
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
        loadEmail()
    }
    
    //MARK: -Selectors
    
    @objc
    func handleResetPassword() {
        guard let email = email else {return}
        
        Service.resetPassword(forEmail: email) { error in
            if let error = error {
                print("DEBUG: Failed to resset password \(error.localizedDescription)")
                return
            }
            
            self.delegate?.didSendResetPasswordLink()
        }
    }
    
    @objc
    func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func textDidChange(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        }
        updateForm()
    }
    
    //MARK: -Helpers
    
    func configureUI() {
        configureGradientBackground()
        
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,paddingTop: 16,paddingLeft: 16)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 120, width: 120)
        iconImage.anchor(top:view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,resetPasswordButton])
        
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func loadEmail() {
        guard let email = email else {return}
        viewModel.email = email
        
        emailTextField.text = email
        
        updateForm()

    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

//MARK: - FormViewModel

extension ResetPasswordController:FormViewModel {
    func updateForm() {
        resetPasswordButton.isEnabled = viewModel.shouldEnableButton
        resetPasswordButton.backgroundColor = viewModel.buttonBackgroundColor
        resetPasswordButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    }
}
