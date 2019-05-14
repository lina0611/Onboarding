//
//  OnboardingViewController.swift
//  OnboardingPractice
//
//  Created by Lina Gao on 5/14/19.
//  Copyright © 2019 Lina Gao. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    let pages = [Page(imageName: "onboarding1", headerText: "Create an account", bodyText: "Connect with people around the world", description: "User will be able to go live, chat and meet with people near by."),
                 Page(imageName: "onboarding2", headerText: "Log in to your account", bodyText: "Let's build connection with new people", description: "Connect helps you locate the people around you who are closest from your home town!"),
                 Page(imageName: "onboarding3", headerText: "Log in to your account", bodyText: "Feel the happiness", description: "User will be able to go live, chat and meet with people near by.")]

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell

        cell.configue(page: pages[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
