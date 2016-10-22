//
//  ViewController.swift
//  ZImageCropper
//
//  Created by ZAID PATHAN on 12/11/15.
//  Copyright © 2015 Zaid Pathan. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

class ViewController: UIViewController {
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    //Update this for path line color
    let strokeColor:UIColor = UIColor.blueColor()
    
    //Update this for path line width
    let lineWidth:CGFloat = 2.0
    
    var path = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    var croppedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ZImageCropper"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //
    //MARK:- Touch event methods
    //
    
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
    
    
    //
    //MARK:- IBAction methods
    //
    
    @IBAction func IBActionCropImage(sender: UIButton) {
        shapeLayer.fillColor = UIColor.blackColor().CGColor
        tempImageView.layer.mask = shapeLayer
    }
    
    @IBAction func IBActionCancelCrop(sender: UIButton) {
        shapeLayer.removeFromSuperlayer()
        path = UIBezierPath()
        shapeLayer = CAShapeLayer()
    }
    
    
    //
    //MARK:- Custom methods
    //
    
    /**
    This methods is adding CAShapeLayer line to tempImageView
    */
    func addNewPathToImage(){
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = strokeColor.CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC:NewImageViewController = segue.destinationViewController as! NewImageViewController
        
        cropImage()
        destinationVC.newImageFile = self.croppedImage
    }

}
