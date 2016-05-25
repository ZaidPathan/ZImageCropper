# ZImageCropper(Swift 2.2)

ZImageCropper is a simplest way to crop image to any shapes you like.

![alt ZImageCropper](https://github.com/ZaidPathan/ZImageCropper/blob/master/giphy.gif)

##Behind the scene

ZImageCropper is using following things as core part:

- UIBezierPath
- UITouch Events
- CAShapeLayer
- CoreGraphics

##How to use it?

According to given demo project do as following in your project.

- Create IBOutlet of your image that you want to crop. (or add one UIImageView object to your class)
```
    //Your UIImageView object whose image will be cropped
    @IBOutlet weak var tempImageView: UIImageView!
```
- Add following code after class declaration:
 ```
    //Update this for path line color
    let strokeColor:UIColor = UIColor.blueColor()
    
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
```
 override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.locationInView(self.tempImageView)
            print("touch begin to : \(touchPoint)")
            path.moveToPoint(touchPoint)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.locationInView(self.tempImageView)
            print("touch moved to : \(touchPoint)")
            path.addLineToPoint(touchPoint)
            addNewPathToImage()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.locationInView(self.tempImageView)
            print("touch ended at : \(touchPoint)")
            path.addLineToPoint(touchPoint)
            addNewPathToImage()
            path.closePath()
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let touch = touches!.first as UITouch?{
            let touchPoint = touch.locationInView(self.tempImageView)
            print("touch canceled at : \(touchPoint)")
            path.closePath()
        }
    }
```
- Add additional methods:
```
 /**
    This methods is adding CAShapeLayer line to tempImageView
    */
    func addNewPathToImage(){
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = strokeColor.CGColor
        shapeLayer.lineWidth = lineWidth
        tempImageView.layer.addSublayer(shapeLayer)
    }
    
    /**
    This methods is making cropped object of tempImageView's image
    */
    func cropImage(){
        UIGraphicsBeginImageContextWithOptions(tempImageView.bounds.size, false, 1)
        
        tempImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.croppedImage = newImage
    }
```

- Add two methods for croping and cancelling crop:
```
    @IBAction func IBActionCropImage(sender: UIButton) {
        tempImageView.layer.mask = shapeLayer
    }
    
    @IBAction func IBActionCancelCrop(sender: UIButton) {
        shapeLayer.removeFromSuperlayer()
        path = UIBezierPath()
        shapeLayer = CAShapeLayer()
    }
```

Feel free to ask any help!
Twitter: @ZaidKhanIntel
