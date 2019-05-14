//
//  LoginViewController.swift
//  OnboardingPractice
//
//  Created by Lina Gao on 5/14/19.
//  Copyright © 2019 Lina Gao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func tapLoginButton(_ sender: Any) {
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController")as! CategoryViewController
        let navigationVC = UINavigationController(rootViewController: categoryVC)

        present(navigationVC, animated: true, completion: nil)
    }
 
    @IBAction private func tapBackButton(_ sender: Any) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
