![header image](./ed-badge.png)
=
# reachability
Swift project to manage connectivity state in an application. 

![header image](./wifi-badge.png?v=4&s=50)

## Table of contents
* [Details](#details)
* [Typical Use](#typical-use)

## Details
Get closure calls when connection to Wi-Fi or Cellular is made. Also a closure for when connection is lost. Pretty simple, but any application that requires a connection for service calls should be able to fail gracefully and notify the user of a problem instead of them thinking that the appliction bombed or is buggy.

There is a small dot being used to show connection state.

  * Cellular has an icon
  * Wi-Fi has an icon
  * Not Connected is light grey with black border
  * Error is red with black border

This is a replacement for Apple's old Reachability code. Tested on device and it seems to work fine. In the Simulator it can be a little dodgy.

## Typical Use

By the way, the enum for ConnectionState is in the ReachabilityUI Class.

```swift
var reachability: Reachability!
var connectionDot: ReachabilityUI!
...
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
