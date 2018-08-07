# PTDLoadingViewController

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/PTDLoadingViewController.svg?style=flat)](http://cocoapods.org/pods/PTDLoadingViewController)
[![License](https://img.shields.io/cocoapods/l/PTDLoadingViewController.svg?style=flat)](http://cocoapods.org/pods/PTDLoadingViewController)
[![Platform](https://img.shields.io/cocoapods/p/PTDLoadingViewController.svg?style=flat)](http://cocoapods.org/pods/PTDLoadingViewController)

PTDLoadingViewController implements a simple code to inform the user during loading.   
PTDLoadingViewControllerは通信中など、読み込みを行なっていることをユーザーに知らせるための画面をシンプルなコードで実装できます。

## Description

- Simple loading screen. This is a display type that covers all screens. It is conceivable to use it when you do not want the user to do other actions.  
端末全ての画面を覆う表示タイプ。例えば処理が終わるまでユーザーに何も操作してほしくない時などに使用できます。

![sample image_001](https://raw.githubusercontent.com/pontake-dev/PTDLoadingViewController/image/PTDLoadingViewController_screenshot_001.png)

- You can also display the loading screen on the specified view. For example, the buttons of UITabBar and UINavigationBar may be used when you want to enable it.  
指定したviewの上に表示させることもできます。  
UITabBarやUINavigationBarのボタンは有効にしたい時などを想定してます。

![sample image_002](https://raw.githubusercontent.com/pontake-dev/PTDLoadingViewController/image/PTDLoadingViewController_screenshot_002.png)

- Can also add a cancel button to the above two display types and display it.  
上記の2パターンの表示にキャンセルボタンを追加して表示させることもできます。

  Can detect that you tapped the cancel button with a closure.  
  キャンセルボタンをタップした事をクロージャで取得できます。  

  The display of the cancel button can be customized.  
  キャンセルボタンの表示はカスタマイズ可能です。

  ![sample image_003](https://raw.githubusercontent.com/pontake-dev/PTDLoadingViewController/image/PTDLoadingViewController_screenshot_003.png)  

  ![sample image_004](https://raw.githubusercontent.com/pontake-dev/PTDLoadingViewController/image/PTDLoadingViewController_screenshot_004.png)

## Example Usages

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

## Installation

### CocoaPods

Add to `Podfile`:

```
pod 'PTDLoadingViewController'
```

### Carthage

Add to `Cartfile`:

```
github "pontake-dev/PTDLoadingViewController"
```

## License

MIT
