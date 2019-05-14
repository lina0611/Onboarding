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
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = .lightGray
        return pc
    }()

    let pages = [Page(imageName: "onboarding1", headerText: "Create an account", bodyText: "Connect with people around the world", description: "User will be able to go live, chat and meet with people near by."),
                 Page(imageName: "onboarding2", headerText: "Log in to your account", bodyText: "Let's build connection with new people", description: "Connect helps you locate the people around you who are closest from your home town!"),
                 Page(imageName: "onboarding3", headerText: "Log in to your account", bodyText: "Feel the happiness", description: "User will be able to go live, chat and meet with people near by.")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        getStartedButton.isHidden = true
    }

    @IBAction func tapNextButton(_ sender: Any) {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func tapSkipButton(_ sender: Any) {
    }

    @IBAction func tapGetStartedButton(_ sender: Any) {

    }

    func updateNextBtnStatus() {
        if pageControl.currentPage == pages.count - 1 {
            getStartedButton.isHidden = false
            nextButton.isHidden = true
            skipButton.isHidden = true
        } else {
            getStartedButton.isHidden = true
        }
    }

    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -140).isActive = true
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
