//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Александр Манжосов on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    
    private var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = StorageManager.shared.getUser()
        userNameLabel.text = "\(user.name) \(user.surname)"
    }

    @IBAction func donePressed() {
        
        guard let firstName = firstNameTextField.text, !(firstName.isEmpty) else {
            wrongFormatAlert()
            return
        }
        guard let secondName = secondNameTextField.text, !(secondName.isEmpty) else {
            wrongFormatAlert()
            return
        }
        if let _ = Double(firstName) {
            wrongFormatAlert()
        } else if let _ = Double(secondName) {
            wrongFormatAlert()
        } else {
            userNameLabel.text = firstName + " " + secondName
            user.name = firstName
            user.surname = secondName
            StorageManager.shared.saveUser(user)
        }
        firstNameTextField.text = nil
        secondNameTextField.text = nil
    }
    
}

extension ViewController {
    private func wrongFormatAlert() {
        let alert = UIAlertController(title: "Wrong Format!",
                                      message: "Please enter your name",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

