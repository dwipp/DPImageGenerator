//
//  ViewController.swift
//  LogoGenerator
//
//  Created by Dwi Putra on 11/10/15.
//  Copyright © 2015 dwipp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txt_field: UITextField!
    @IBOutlet var img_image: UIImageView!
    
    let imageGen:DPImageGenerator = DPImageGenerator()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        img_image.layer.cornerRadius = 15
        imageGen.image_frame = img_image.frame
        imageGen.text_font = UIFont(name: "HelveticaNeue", size: 80)
        imageGen.text_color = UIColor.whiteColor()
        imageGen.max_char = maxCharacter.two
        imageGen.dynamic_gradient = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_generate(sender: AnyObject) {
        self.view.endEditing(true)
        if txt_field.text != "" {
            img_image.image = imageGen.imageGenerator(txt_field.text!)
        }
    }
}

