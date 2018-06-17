//
//  ImageViewController.swift
//  IMGallery
//
//  Created by Venkatesh on 18/06/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import UIKit
import PINRemoteImage

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: FLAnimatedImageView!
     var imgstr: String!

    // MARK: - Viewcontroller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.pin_updateWithProgress = true
        self.imageView.pin_setImage(from: URL(string: self.imgstr))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
