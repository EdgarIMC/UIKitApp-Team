//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit
import CoreData

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
        
        registerUser()
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        emailTxtField.addShake()
        if emailTxtField.text != nil {
            emailTxtField.removeShake()
        }
        validateUser()
    }
    
    func registerUser(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: context)
        user.setValue(fullNameTxtField.text, forKey: "fullName")
        user.setValue(emailTxtField.text, forKey: "email")
        user.setValue(pwdTxtField.text, forKey: "password")
        
        do{
            try context.save()
        }catch let error as NSError {
            print("No se pudo guardar el registro.. \(error)")
        }
    }
    
    func validateUser() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "fullName") as! String)
            }
            
        }catch{
            print("Fail")
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
