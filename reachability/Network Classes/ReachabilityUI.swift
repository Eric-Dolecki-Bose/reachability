//
//  ReachabilityUI.swift
//  reachability
//
//  Created by Eric Dolecki on 6/5/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

enum ConnectionState {
    case WIFI, CELLULAR, NOT_CONNECTED, ERROR
}

class ReachabilityUI: UIView {

    var connectionState: ConnectionState = .NOT_CONNECTED
    var myLabel: UILabel!
    var myImage: UIImageView!
    
    init(state n: ConnectionState)
    {
        connectionState = n
        super.init(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        
        myLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 180, height: 15))
        myLabel.font = UIFont.systemFont(ofSize: 10)
        myLabel.textColor = UIColor.darkGray
        self.addSubview(myLabel)
        
        myImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
        myImage.contentMode = .scaleAspectFit
        self.addSubview(myImage)
        
        evaluateConnectionState()
    }
    
    public func setConnection(state n: ConnectionState)
    {
        connectionState = n
        evaluateConnectionState()
    }
    
    private func evaluateConnectionState()
    {
        myLabel.fadeTransition(0.3)
        myImage.fadeTransition(0.3)
        if connectionState == .CELLULAR {
            self.backgroundColor = UIColor.clear
            self.myLabel.text = "CELLULAR"
            self.myImage.image = UIImage(named: "cellular")
            self.layer.borderWidth = 0
        } else if connectionState == .WIFI {
            self.backgroundColor = UIColor.clear
            self.myLabel.text = "WI-FI"
            self.myImage.image = UIImage(named: "wifi")
            self.layer.borderWidth = 0
        } else if connectionState == .ERROR {
            self.backgroundColor = UIColor.red
            self.myLabel.text = "ERROR"
            self.myImage.image = nil
            self.layer.borderWidth = 2
        } else if connectionState == .NOT_CONNECTED {
            self.backgroundColor = UIColor.lightGray
            self.myLabel.text = "..."
            self.myImage.image = nil
            self.layer.borderWidth = 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// Used for text and image fade transitioning.
extension UIView {
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
