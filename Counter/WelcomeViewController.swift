//
//  WelcomeViewController.swift
//  Counter
//
//  Created by user on 17.10.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        if let savedUsername = UserDefaults.standard.string(forKey: "savedUsername"),
           UserDefaults.standard.bool(forKey: "rememberMeKey") {
                    userLabel.text = "Welcome, \(savedUsername)"
                    loginTextField.text = savedUsername
                    rememberMeSwitch.isOn = true
                } else {
                    // Если пользователь не сохранен или "Remember me" выключен
                    userLabel.text = "Welcome, User"
                    rememberMeSwitch.isOn = false
                }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let username = loginTextField.text, let password = passwordTextField.text else{return}
        if password == UserDefaults.standard.object(forKey: username) as? String {
            if rememberMeSwitch.isOn {
                // Сохраняем имя пользователя, если "Remember me" включен
                UserDefaults.standard.set(username, forKey: "savedUsername")
                UserDefaults.standard.set(true, forKey: "rememberMeKey")
            } else {
                UserDefaults.standard.removeObject(forKey: "savedUsername")
                UserDefaults.standard.set(false, forKey: "rememberMeKey")
            }
            performSegue(withIdentifier: "showMainScreen", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        guard let username = loginTextField.text, let password = passwordTextField.text
        else {
            let alert = UIAlertController(title: "Ошибка", message: "Придумайте логин и пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        UserDefaults.standard.set(password, forKey: username)
        if rememberMeSwitch.isOn {
            // Сохраняем имя пользователя, если "Remember me" включен
            UserDefaults.standard.set(username, forKey: "savedUsername")
            UserDefaults.standard.set(true, forKey: "rememberMeKey")
        } else {
            UserDefaults.standard.removeObject(forKey: "savedUsername")
            UserDefaults.standard.set(false, forKey: "rememberMeKey")
        }
        performSegue(withIdentifier: "showMainScreen", sender: self)
    }
    
    @IBAction func rememberMeSwitch(_ sender: UISwitch) {
        if sender.isOn {
                    UserDefaults.standard.set(true, forKey: "rememberMeKey")
                } else {
                    UserDefaults.standard.set(false, forKey: "rememberMeKey")
                }
    }
}
