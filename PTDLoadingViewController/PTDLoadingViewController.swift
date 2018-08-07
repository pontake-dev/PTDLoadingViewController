//
//  PTDLoadingViewController.swift
//  PTDLoadingViewController
//
//  Created by pontake-dev on 2017/12/31.
//  Copyright © 2017年 pontake-dev. All rights reserved.
//

import UIKit

public class PTDLoadingViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet public weak var cancelButton: UIButton!
    private var cancelClosure: ( ()->() )?

    /// singleton instance
    public static let shared: PTDLoadingViewController = {
        let bundle = Bundle(for: PTDLoadingViewController.self)
        let instance = UIStoryboard(name: "PTDLoadingViewController", bundle: bundle).instantiateInitialViewController() as! PTDLoadingViewController

        //Since it is necessary to create an instance of the property to decorate the cancelButton,
        //it is displayed once in the dummy window. and remove.
        let dummyWindow = UIWindow()
        dummyWindow.addSubview(instance.view)
        instance.view.removeFromSuperview()
        return instance
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        if let cancelClosure = cancelClosure {
            cancelClosure()
        }
    }

    public func showLoadingIndicatorCoveringAllScreens() {
        cancelClosure = nil
        DispatchQueue.main.async {
            self.adjustViewOnScreenRect(UIScreen.main.bounds)
            UIApplication.shared.delegate?.window??.addSubview(self.view)
            self.cancelButton.isHidden = true
            self.indicator.startAnimating()
        }
    }

    public func showLoadingIndicatorOnView(_ view: UIView) {
        cancelClosure = nil
        DispatchQueue.main.async {
            self.adjustViewOnScreenRect(view.bounds)
            view.addSubview(self.view)
            self.cancelButton.isHidden = true
            self.indicator.startAnimating()
        }
    }

    public func showCancelableLoadingIndicatorCoveringAllScreens(cancelTapped: @escaping () -> ()) {
        cancelClosure = cancelTapped
        DispatchQueue.main.async {
            self.adjustViewOnScreenRect(UIScreen.main.bounds)
            UIApplication.shared.delegate?.window??.addSubview(self.view)
            self.cancelButton.isHidden = false
            self.indicator.startAnimating()
        }
    }

    public func showCancelableLoadingIndicatorOnView(_ view: UIView, cancelTapped: @escaping () -> ()) {
        cancelClosure = cancelTapped
        DispatchQueue.main.async {
            self.adjustViewOnScreenRect(view.bounds)
            view.addSubview(self.view)
            self.cancelButton.isHidden = false
            self.indicator.startAnimating()
        }
    }

    public func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
            self.indicator.stopAnimating()
        }
    }

    private func adjustViewOnScreenRect(_ rect: CGRect) {
        self.view.frame = rect
    }
}
