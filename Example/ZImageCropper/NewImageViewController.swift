//
//  NewImageViewController.swift
//  ZImageCropper
//
//  Created by ZAID PATHAN on 12/11/15.
//  Copyright © 2015 Zaid Pathan. All rights reserved.
//

import UIKit

class NewImageViewController: UIViewController {

    @IBOutlet weak var IBimgNewCroppedImage: UIImageView!
    
    var newImageFile:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        IBimgNewCroppedImage.image = newImageFile
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
