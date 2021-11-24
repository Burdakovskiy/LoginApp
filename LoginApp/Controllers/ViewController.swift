//
//  ViewController.swift
//  LoginApp
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let user = User.getUserDescription()
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let profileVC = navigationVC.topViewController as! ProfileViewController
        welcomVC.user = user
        profileVC.user = user
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.placeholder = "Enter login"
        passwordTextField.placeholder = "Enter password"
        
    }
    
    //MARK: - IBAction
    
    @IBAction func loginButton() {
        guard loginTextField.text == user.login,
              passwordTextField.text == user.password
        else { showAlert(title: "Ooops", message: "Wrong login or password", textField: passwordTextField)
            return
            }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotLoginButton() {
        showAlert(title: "Lol", message: "You login is \(user.login)", textField: nil)
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Lol", message: "You password is \(user.password)", textField: nil)
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
}

//MARK: - Show Alert

extension ViewController {
    func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
//MARK: - Text Field Delegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButton()
        }
        return true
    }
}
