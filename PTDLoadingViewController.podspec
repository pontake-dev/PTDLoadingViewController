Pod::Spec.new do |s|
  s.name         = "PTDLoadingViewController"
  s.version      = "1.0.0"
  s.summary      = "PTDLoadingViewController implements a simple code to inform the user during loading."
  s.description  = <<-DESC
  PTDAlertViewController is a wrapper around UIalertcontroller that displays Alerts with simple code.

  Example Usages

  ```swift
  // MARK: covering all screens.

let loadingView = PTDLoadingViewController.shared
loadingView.showLoadingIndicatorCoveringAllScreens()

//disappear after 2 seconds.
DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    //hide indicator
    loadingView.hideLoadingIndicator()
}

// MARK: above the specified view

let loadingView = PTDLoadingViewController.shared
loadingView.showLoadingIndicatorOnView(self.view)

//disappear after 2 seconds.
DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    //hide indicator
    loadingView.hideLoadingIndicator()
}

// MARK: cancelable indicator covering all screens
let loadingView = PTDLoadingViewController.shared
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

// MARK: cancelable above the specified view
let loadingView = PTDLoadingViewController.shared
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

// MARK: example of decorating a cancel button
let loadingView = PTDLoadingViewController.shared
loadingView.cancelButton.backgroundColor = UIColor.green
loadingView.cancelButton.layer.cornerRadius = 5
//and so on
  ```
                   DESC
                   s.homepage     = "https://github.com/pontake-dev/PTDLoadingViewController"
                   s.license      = { :type => "MIT", :file => "LICENSE" }
                   s.author             = { "pontake-dev" => "pontake.dev@gmail.com" }
                   s.platform     = :ios, "9.0"
                   s.swift_version = "4.0"
                   s.source       = { :git => "https://github.com/pontake-dev/PTDLoadingViewController.git", :tag => "#{s.version}" }
                   s.source_files  = "PTDLoadingViewController/**/*.{swift}"
end
