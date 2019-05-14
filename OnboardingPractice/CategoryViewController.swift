//
//  CategoryViewController.swift
//  OnboardingPractice
//
//  Created by Lina Gao on 5/14/19.
//  Copyright © 2019 Lina Gao. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBakcButton))
        self.navigationItem.title = "Category"
    }

    @objc func handleBakcButton() {
        guard let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as? LoginViewController else {
            return
        }
        self.present(loginViewController, animated: true, completion: nil)
    }
}
