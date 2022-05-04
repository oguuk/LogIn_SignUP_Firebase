//
//  CustomTextField.swift
//  Login&SignUpWithFirebase
//
//  Created by 오국원 on 2022/05/04.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String){
        super .init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 0, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(height: 50)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1.0, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
