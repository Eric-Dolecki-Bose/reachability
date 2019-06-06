//
//  ViewController.swift
//  reachability
//
//  Created by Eric Dolecki on 6/5/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var reachability: Reachability!
    var connectionDot: ReachabilityUI!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        connectionDot = ReachabilityUI(state: .NOT_CONNECTED)
        connectionDot.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        self.view.addSubview(connectionDot)
        
        reachability = Reachability()
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                self.connectionDot.setConnection(state: .WIFI)
            } else {
                self.connectionDot.setConnection(state: .CELLULAR)
            }
        }
        
        reachability.whenUnreachable = { _ in
            self.connectionDot.setConnection(state: .NOT_CONNECTED)
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            self.connectionDot.setConnection(state: .ERROR)
        }
    }
}

