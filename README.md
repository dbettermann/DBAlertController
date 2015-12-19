# DBAlertController
Adding UIAlertView's show() functionality to UIAlertController.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/DBAlertController.svg)](https://img.shields.io/cocoapods/v/DBAlertController.svg)

## Background
Have you ever needed to present an alert without knowing the visible view controller? In case you're drawing a blank, let me give an example.

### Example - App Updates
Assume we have an app in the App Store and we want to let the users know there is an update. How would we do that?

#### iOS 7 and earlier - UIAlertView
**AppDelegate.swift**
```swift
func applicationDidBecomeActive(application: UIApplication) {
    if update {
        UIAlertView(title: "Update Available", message: "Would you like to update your app?", delegate: self, cancelButtonTitle: "Yes!").show()
    }
}
```
Easy, right? We don't have to worry about which view controller is visible. UIAlertView seems to find the visible view controller and add itself as a subview. 

UIAlertView and system alerts might actually use their own UIWindow just like DBAlertController, but I digress.

#### iOS 8 and newer - UIAlertController
**AppDelegate.swift**
```swift
func applicationDidBecomeActive(application: UIApplication) {
    if update {
        let alertController = UIAlertController(title: "Update Available", message: "Would you like to update your app?", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Yes!", style: .Default, handler: nil))
    
        window!.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
}
```
This will work... but only if the rootViewController's view is in the window hierarchy.

What if the rootViewController's view is *not* in the window hierarchy?

1. The UIAlertController does not appear.
2. You get a warning message written to your console. Something like:
```
015-05-13 08:09:58.923 DBAlertController[1002:15635] Warning: Attempt to present <UIAlertController: 0x7ff5f2e3a500> on <UINavigationController: 0x7ff5f2f24760> whose view is not in the window hierarchy!
```

There's a demo of this scenario in the source. Pull it down and try it yourself.

## Fixing the issue
DBAlertController fixes the issue above by presenting the UIAlertController on its own UIWindow.

## Installation

### Cocoapods
Add `pod 'DBAlertController'` to your Podfile.

### Carthage
Add `github "dbettermann/DBAlertController"` to your Cartfile.

### Manual
Copy and paste DBAlertController.swift into your project.

## Usage

```swift
let alertController = DBAlertController(title: "DBAlertController", message: "Hello World!", preferredStyle: .Alert)
alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
alertController.show()
```
Here is the full signature for `show()`:
```swift
func show(animated flag: Bool = true, completion: (() -> Void)? = nil)
```
As you can see, you can also pass an animated flag and completion closure that get passed along to
```swift
presentViewController(alertController, animated: flag, completion: completion)
```

## Feedback
All feedback is welcome. [Tweet](https://twitter.com/dbettermann "@dbettermann") at me or send me an [email](mailto:dylan.bettermann@gmail.com) with any questions, comments, or issues.
