# ZImageCropper(Swift 4)

ZImageCropper is a simplest way to crop image to any shapes you like.

![alt ZImageCropper](https://github.com/ZaidPathan/ZImageCropper/blob/master/giphy.gif)

## Behind the scene

ZImageCropper is using following things as core part:

- UIBezierPath
- UITouch Events
- CAShapeLayer
- CoreGraphics

## How to use it?

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
According to given demo project do as following in your project.

- Create IBOutlet of your image that you want to crop. (or add one UIImageView object to your class)
```swift
    //Your UIImageView object whose image will be cropped
    @IBOutlet weak var tempImageView: UIImageView!
```
- Add following code after class declaration:
```swift
    //Update this for path line color
    let strokeColor:UIColor = UIColor.blue
    
    //Update this for path line width
    let lineWidth:CGFloat = 2.0
    
    //Path to draw while touch events occur
    var path = UIBezierPath()
    
    //ShapeLayer of cropped view
    var shapeLayer = CAShapeLayer()
    
    //Final Cropped Image
    var croppedImage = UIImage()
```

- Add UITouch even methods like this:
```swift
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.tempImageView)
            print("touch begin to : \(touchPoint)")
            path.move(to: touchPoint)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.tempImageView)
            print("touch moved to : \(touchPoint)")
            path.addLine(to: touchPoint)
            addNewPathToImage()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.tempImageView)
            print("touch ended at : \(touchPoint)")
            path.addLine(to: touchPoint)
            addNewPathToImage()
            path.close()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self.tempImageView)
            print("touch canceled at : \(touchPoint)")
            path.close()
        }
    }
```
- Add additional methods:
```swift
 /**
    This methods is adding CAShapeLayer line to tempImageView
    */
    func addNewPathToImage(){
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        tempImageView.layer.addSublayer(shapeLayer)
    }
    
    /**
    This methods is making cropped object of tempImageView's image
    */
    func cropImage(){
        UIGraphicsBeginImageContextWithOptions(tempImageView.bounds.size, false, 1)
        
        tempImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.croppedImage = newImage!
    }
```

- Add two methods for croping and cancelling crop:
```swift
    @IBAction func IBActionCropImage(_ sender: UIButton) {
        shapeLayer.fillColor = UIColor.black.cgColor
        tempImageView.layer.mask = shapeLayer
    }
    
    @IBAction func IBActionCancelCrop(_ sender: UIButton) {
        shapeLayer.removeFromSuperlayer()
        path = UIBezierPath()
        shapeLayer = CAShapeLayer()
    }
```

Feel free to ask any help!
Twitter: [@ZaidKhanIntel](https://twitter.com/zaidkhanintel)
