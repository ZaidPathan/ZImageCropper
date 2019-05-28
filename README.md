# ZImageCropper

[![CI Status](https://img.shields.io/travis/ZaidPathan/ZImageCropper.svg?style=flat)](https://travis-ci.org/ZaidPathan/ZImageCropper)
[![Version](https://img.shields.io/cocoapods/v/ZImageCropper.svg?style=flat)](https://cocoapods.org/pods/ZImageCropper)
[![License](https://img.shields.io/cocoapods/l/ZImageCropper.svg?style=flat)](https://cocoapods.org/pods/ZImageCropper)
[![Platform](https://img.shields.io/cocoapods/p/ZImageCropper.svg?style=flat)](https://cocoapods.org/pods/ZImageCropper)

ZImageCropper is a simplest way to crop image to any shapes you like.

![alt ZImageCropper](https://github.com/ZaidPathan/ZImageCropper/blob/master/giphy.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### Cocoapods
ZImageCropper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZImageCropper'
```

### Manual
Add ` ZImageCropper.swift` and ` ZImageCropperView.swift` files to your project.

## Usage
### Crop using AI (Or programmatically)

Crop image using following code,

```swift
let croppedImage = ZImageCropper.cropImage(ofImageView: yourImageView, withinPoints: [
CGPoint(x: 0, y: 0),   //Start point
CGPoint(x: 100, y: 0),
CGPoint(x: 100, y: 100),
CGPoint(x: 0, y: 100)  //End point
])
```

Note : Make sure you provide valid points, points must be >=2 in count.

### Crop using user touches,
**Step 1:** Add `UIImageView` to your `StoryBoard/XIB` and give it a Class Name: `ZImageCropperView`

**Step 2:** Run the app and see cropping is enable to your `UIImageView`

**Step 3:** Add `@IBOutlet` of your `UIImageView` and call method `imageView.cropImage()` to crop selected layer by user.

## Author

Zaid Pathan

## Contributor

[Zaid Pathan](http://github.com/ZaidPathan), [Devansh Vyas](http://github.com/devanshvyas)

## License

ZImageCropper is available under the MIT license. See the LICENSE file for more info.
