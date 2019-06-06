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
    
    init(state n: ConnectionState)
    {
        connectionState = n
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.layer.cornerRadius = self.frame.height / 2
        evaluateConnectionState()
    }
    
    public func setConnection(state n: ConnectionState)
    {
        connectionState = n
        evaluateConnectionState()
    }
    
    private func evaluateConnectionState()
    {
        if connectionState == .CELLULAR {
            self.backgroundColor = UIColor.blue
        } else if connectionState == .WIFI {
            self.backgroundColor = UIColor.orange
        } else if connectionState == .ERROR {
            self.backgroundColor = UIColor.red
        } else if connectionState == .NOT_CONNECTED {
            self.backgroundColor = UIColor.lightGray
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
