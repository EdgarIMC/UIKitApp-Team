//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTxtField: CustomTextField!
    @IBOutlet weak var fullNameTxtField: CustomTextField!
    @IBOutlet weak var pwdTxtField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: Any) {
        emailTxtField.addShake()
        fullNameTxtField.addShake()
        pwdTxtField.addShake()
        if emailTxtField.text != "" {
            emailTxtField.removeShake()
        }
        if fullNameTxtField.text != "" {
            fullNameTxtField.removeShake()
        }
        if pwdTxtField.text != "" {
            pwdTxtField.removeShake()
        }
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        emailTxtField.addShake()
        if emailTxtField.text != nil {
            emailTxtField.removeShake()
        }
    }
}

// MARK: - Static Methods
extension SignUpViewController {
    static func getViewController() -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            fatalError("ViewController must be of type SignUpViewController")
        }
        return signUpViewController
    }
}
