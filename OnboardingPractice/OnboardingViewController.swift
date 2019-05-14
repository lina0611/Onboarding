//
//  OnboardingViewController.swift
//  OnboardingPractice
//
//  Created by Lina Gao on 5/14/19.
//  Copyright © 2019 Lina Gao. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var controlStackView: UIStackView!

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()

    /// Generate Data to display
    let pages = [Page(imageName: "onboarding1",
                      headerText: "Create an account",
                      bodyText: "Connect with people around the world",
                      description: "User will be able to go live, chat and meet with people near by."),
                 Page(imageName: "onboarding2",
                      headerText: "Log in to your account",
                      bodyText: "Let's build connection with new people",
                      description: "Connect helps you locate the people around you who are closest from your home town!"),
                 Page(imageName: "onboarding3",
                      headerText: "Log in to your account",
                      bodyText: "Feel the happiness",
                      description: "User will be able to go live, chat and meet with people near by.")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        showControlStackView()
    }

    // MARK: - Page Control

    private func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -140).isActive = true
    }

    // MARK: - IBAction

    @IBAction private func tapNextButton(_ sender: Any) {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        updateControlUI()
    }
    
    @IBAction private func tapSkipButton(_ sender: Any) {
        guard let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as? LoginViewController else { return }
        self.present(loginViewController, animated: true, completion: nil)
    }

    @IBAction private func tapGetStartedButton(_ sender: Any) {
        guard let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as? LoginViewController else { return }
        self.present(loginViewController, animated: true, completion: nil)
    }

    // MARK: - Update UI on bottom of the screen

    private func showControlStackView() {
        getStartedButton.isHidden = true
        controlStackView.isHidden = false
        self.view.bringSubviewToFront(controlStackView)
    }

    private func showStartButton() {
        getStartedButton.isHidden = false
        controlStackView.isHidden = true
        self.view.bringSubviewToFront(getStartedButton)
    }

    private func updateControlUI() {
        if pageControl.currentPage == pages.count - 1 {
            showStartButton()
        } else {
            showControlStackView()
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
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
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        // Update page control on swipe
        pageControl.currentPage = Int(x / view.frame.width)
        // This methond has to be call after the pageControl is updated
        updateControlUI()
    }
}
