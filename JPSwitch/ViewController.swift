//
//  ViewController.swift
//  JPSwitch
//
//  Created by Hoi Pham Ngoc on 7/2/16.
//  Copyright © 2016 John Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, JPSwitchChangeValueDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view:JPSwitch = loadViewFromNib() as? JPSwitch {
            view.frame = CGRectMake(0, 0, 70, 150)
            view.center = self.view.center;
            view.delegate = self;
            self.view.addSubview(view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "JPSwitch", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func JPSwitchDidChangeValue(value: Bool) {
        if value {
        }
    }
}

