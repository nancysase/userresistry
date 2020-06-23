//
//  LoginViewController.swift
//  GsTodo
//
//  Created by SASE Koichiro on 2020/06/20.
//  Copyright © 2020 yamamototatsuya. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return}
        if email.isEmpty && password.isEmpty {
            self.showAlert(title: "error", message: "mail pw necessary")
        } else if email.isEmpty {
            self.showAlert(title: "error", message: "mail necessary")
        } else if password.isEmpty {
            self.showAlert(title: "error", message: "pw neessary")
        } else {
            self.emailSingUp(email: email, password: password)
        }
     }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return}
        self.emailLogin(email: email, password: password)
    }
    
    @IBAction func tapTermsButton(_ sender: Any) {
        let termVC = TermsViewController()
        self.present(termVC, animated: true, completion: nil)
    }
    
    func emailSingUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){
            (result, error) in
            if let error = error as NSError?{
                self.signUpError(error)
            } else {
                self.presentTaskList()
                print("成功しました")
            }
        }
    }
    
    func emailLogin(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            if let error = error as NSError?{
                
            }else{
                self.presentTaskList()
            }
        }
            }
    
    func presentTaskList(){
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String?){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func signUpError (_ error: NSError){
        if let errCode = AuthErrorCode(rawValue: error.code){
            var message = ""
            switch errCode {
            case .invalidEmail:
                message = "有効なメールアドレスを入力してください"
            case .emailAlreadyInUse:
                message = "既に登録されているメールアドレスです"
            case .weakPassword:
                message = "パスワードは６文字以上で入力してください"
            default:
                message = "error"
            }
        }
    }
}
