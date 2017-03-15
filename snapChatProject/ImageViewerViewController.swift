//
//  ImageViewerViewController.swift
//  snapChatProject
//
//  Created by Evan Chang on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    
    var image: UIImage?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
            imageViewOutlet.image = image
        } else {
            print("No image here Something's wrong :(")
        }
    }
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
}
