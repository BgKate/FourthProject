//
//  ViewController.swift
//  FourthProject
//
//  Created by Ekaterina Bogdanova on 03/04/2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    @IBAction func logInButtonTapped () {
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        
        let userNamePattern = "<[a-zA-Z]{3,20}$"
        let isUserNameValid = NSPredicate(format: "SELF MATCHES %@", userNamePattern).evaluate(with: inputText)
        if !isUserNameValid {
            showAlert(withTitle: "Wrong format", andMessage: "Please enter your name")
        }
        userNameTextField.text = ""
    }
    
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
