# ZImageCropper(Swift 4)

ZImageCropper is a simplest way to crop image to any shapes you like.

![alt ZImageCropper](https://github.com/ZaidPathan/ZImageCropper/blob/master/giphy.gif)

## Behind the scene

ZImageCropper is using following things as core part:

- UIBezierPath
- UITouch Events
- CAShapeLayer
- CoreGraphics

## Installation
> Note: Cocoapods & Carthage support coming soon.

## Usage

### Crop using AI (Or programmatically)
Try Following steps,

**Step 1:** Add ZImageCropper.swift file to your project.

**Step 2:** Crop image using following,

```swift
let croppedImage = ZImageCropper.cropImage(ofImageView: yourImageView, withinPoints: [
CGPoint(x: 0, y: 0),   //Start point
CGPoint(x: 100, y: 0),
CGPoint(x: 100, y: 100),
CGPoint(x: 0, y: 100)  //End point
])
```

Note : Make sure you provide valid points, points must be >=2 in count.


### Crop using user touches
**Step 1:** Add `ZImageCropperView.swift` file to your project 

**Step 2:** Add UIImageView to your StoryBoard/XIB and give it a Class Name: `ZImageCropperView`

**Step 3:** Run the app and see cropping is enable to your `UIImageView`

**Step 4:** Add `@IBOutlet` of your UIImageView and call method `imageView.cropImage()` to crop selected layer by user.

Feel free to ask for any help!
