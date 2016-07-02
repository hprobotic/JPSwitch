//
//  JPSwitch.swift
//  JPSwitch
//
//  Created by Hoi Pham Ngoc on 7/2/16.
//  Copyright © 2016 John Pham. All rights reserved.
//

import UIKit

protocol JPSwitchChangeValueDelegate {
    func JPSwitchDidChangeValue(value:Bool)
}

class JPSwitch: UIView {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var leftSpace: NSLayoutConstraint!
    @IBOutlet weak var swBarView: UIView!
    @IBOutlet weak var swBarChildLineView: UIView!
    
    var delegate: JPSwitchChangeValueDelegate?
    
    private var status:Bool = false
    
    private var originPosition:CGFloat = 0.0
    private var finalPosition:CGFloat = 0.0
    
    override func awakeFromNib() {
        setUpUI()
    }
    
    func setUpUI() {
        
    }
    
    override func layoutSubviews() {
        
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.clipsToBounds = true
        swBarView.layer.cornerRadius = swBarView.frame.height / 2
        swBarChildLineView.layer.cornerRadius = swBarChildLineView.frame.height / 2
        button.layer.cornerRadius = button.frame.height / 2
        originPosition = 10;
        finalPosition = self.frame.width - 10 - self.button.frame.width;
        leftSpace.constant = originPosition
    }
    
    @IBAction func JPSwitchButtonDidTouch(sender: AnyObject) {
        animationJPSwitchButton(status)
        status = !status;
        delegate?.JPSwitchDidChangeValue(status)
    }
    
    func animationJPSwitchButton(status:Bool) {
        if status {
            
            // Clear Shadow
            self.button.layer.shadowOffset = CGSizeZero
            self.button.layer.shadowOpacity = 0
            self.button.layer.shadowRadius = self.button.frame.height / 2
            self.button.layer.cornerRadius = self.button.frame.height / 2
            self.button.layer.shadowPath = nil
            
            // Rotate animation
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotateAnimation.fromValue = 0.0
            rotateAnimation.toValue = CGFloat(M_PI)
            rotateAnimation.duration = 0.5
            rotateAnimation.cumulative = false;
            
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.swBarView.backgroundColor = UIColor(red:0.40, green:0.85, blue:0.56, alpha:1.0)
                self.swBarChildLineView.backgroundColor = UIColor(red:0.25, green:0.77, blue:0.41, alpha:1.0)
                self.leftSpace.constant = self.originPosition
                self.layoutIfNeeded()
                }, completion: { (finish:Bool) -> Void in
                    
            })
            
        } else {
            
            // Rotate animation
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotateAnimation.fromValue = CGFloat(M_PI)
            rotateAnimation.toValue = 0.0
            rotateAnimation.duration = 0.5
            rotateAnimation.cumulative = false;
            
            // Translation animation
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                
                self.leftSpace.constant = self.finalPosition
                self.swBarView.backgroundColor = UIColor(red:1.00, green:0.28, blue:0.33, alpha:1.0)
                self.swBarChildLineView.backgroundColor = UIColor(red:1.00, green:0.13, blue:0.17, alpha:1.0)
                self.layoutIfNeeded()
                }, completion: { (finish:Bool) -> Void in
                    self.button.layer.shadowOffset = CGSizeMake(0, 0.2)
                    self.button.layer.shadowOpacity = 0.3
                    self.button.layer.shadowRadius = 5.0
                    self.button.layer.cornerRadius = self.button.frame.height / 2
                    self.button.layer.shadowPath = UIBezierPath(roundedRect: self.button.layer.bounds, cornerRadius: self.button.frame.height / 2).CGPath
            })
            
        }
    }
}

