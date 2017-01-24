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
    let strokeColor:UIColor = UIColor.blue
    
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
    
    
    //
    //MARK:- IBAction methods
    //
    
    @IBAction func IBActionCropImage(_ sender: UIButton) {
        shapeLayer.fillColor = UIColor.black.cgColor
        tempImageView.layer.mask = shapeLayer
    }
    
    @IBAction func IBActionCancelCrop(_ sender: UIButton) {
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC:NewImageViewController = segue.destination as! NewImageViewController
        
        cropImage()
        destinationVC.newImageFile = self.croppedImage
    }

}
