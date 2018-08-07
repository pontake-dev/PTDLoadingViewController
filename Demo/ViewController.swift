//
//  ViewController.swift
//  Demo
//
//  Created by pontake-dev on 2018/08/0.3
//  Copyright © 2018年 pontake-dev. All rights reserved.
//

import UIKit
import PTDLoadingViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //create navigation leftBarButtonItem
        let navigationBarButtonItem = UIBarButtonItem(title: "button",
                                                      style: .done,
                                                      target: self,
                                                      action: #selector(navigationBarButtonTapped))
        self.navigationItem.leftBarButtonItem = navigationBarButtonItem

        //Example of decorating a cancel button
        let loadingView = PTDLoadingViewController.shared
        loadingView.cancelButton.backgroundColor = UIColor.green
        loadingView.cancelButton.layer.cornerRadius = 5
        //and so on
    }

    @IBAction func coveringAllScreensButtonTapped(_ sender: UIButton) {
        let loadingView = PTDLoadingViewController.shared
        //show indicator covering all screens
        loadingView.showLoadingIndicatorCoveringAllScreens()

        //disappear after 2 seconds.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //hide indicator
            loadingView.hideLoadingIndicator()
        }
    }

    @IBAction func showOnViewButtonTapped(_ sender: UIButton) {
        let loadingView = PTDLoadingViewController.shared
        //show indicator above the specified view
        loadingView.showLoadingIndicatorOnView(self.view)

        //disappear after 2 seconds.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //hide indicator
            loadingView.hideLoadingIndicator()
        }
    }

    @IBAction func cancelableCoveringAllScreensButtonTapped(_ sender: UIButton) {
        let loadingView = PTDLoadingViewController.shared
        //show cancelable indicator covering all screens
        loadingView.showCancelableLoadingIndicatorCoveringAllScreens {
            print("cancel button tapped")
            //hide indicator
            loadingView.hideLoadingIndicator()
        }

        //disappear after 5.0 seconds.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //hide indicator
            loadingView.hideLoadingIndicator()
        }
    }

    @IBAction func cancelableIndicatorOnViewButtonTapped(_ sender: UIButton) {
        let loadingView = PTDLoadingViewController.shared
        //show cancelable above the specified view
        loadingView.showCancelableLoadingIndicatorOnView(self.view) {
            print("cancel button tapped")
            //hide indicator
            loadingView.hideLoadingIndicator()
        }

        //disappear after 5.0 seconds.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //hide indicator
            loadingView.hideLoadingIndicator()
        }
    }

    // navigation leftBarButton tap action
    @objc func navigationBarButtonTapped() {
        print("navigationBarButton tapped")
    }
}

//tabBarItem tap test
class CustomTabBarController: UITabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //called when you tap a tabBar item
        print("tabBar item tapped")
    }
}
