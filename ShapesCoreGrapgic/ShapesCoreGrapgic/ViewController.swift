//
//  ViewController.swift
//  ShapesCoreGrapgic
//
//  Created by don't touch me on 10/17/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let myView = ShapeView(frame: CGRect(x: 25, y: 200, width: 280, height: 250), shape: sender.tag)
        myView.backgroundColor = UIColor.cyan
        view.addSubview(myView)
    }
    


}

