//
//  PageCell.swift
//  OnboardingPractice
//
//  Created by Lina Gao on 5/14/19.
//  Copyright © 2019 Lina Gao. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    @IBOutlet private weak var headerTextView: UITextView!
    @IBOutlet private weak var bodyTextView: UITextView!
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!

    func configue(page: Page) {
        imageView.image = UIImage(named: page.imageName)
        headerTextView.text = page.headerText
        bodyTextView.text = page.bodyText
        descriptionTextView.text = page.description
    }
}
