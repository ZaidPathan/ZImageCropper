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
    
    @IBOutlet weak var imageView: ZImageCropperView!
    var croppedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ZImageCropper"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //
    //MARK:- IBAction methods
    //
    
    @IBAction func IBActionCropImage(_ sender: UIButton) {
        croppedImage = imageView.cropImage()
    }
    
    @IBAction func IBActionAI(_ sender: Any) {
        croppedImage = ZImageCropper.cropImage(ofImageView: imageView, withinPoints: [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 100, y: 0),
            CGPoint(x: 100, y: 100),
            CGPoint(x: 0, y: 100)
            ])
    }
    
    @IBAction func IBActionCancelCrop(_ sender: UIButton) {
        imageView.resetCrop()
        croppedImage = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC:NewImageViewController = segue.destination as! NewImageViewController

        destinationVC.newImageFile = croppedImage
    }
}
