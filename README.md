# reachability
Swift project to manage connectivity state in an application. 

### Details ###
Get closure calls when connection to Wi-Fi or Cellular is made. Also a closure for when connection is lost. Pretty simple, but any application that requires a connection for service calls should be able to fail gracefully and notify the user of a problem instead of them thinking that the appliction bombed or is buggy.

There is a small dot being used to show connection state. It should use icons instead of color in the future.

  * Cellular is blue
  * Wi-Fi is orange
  * Not Connected is light grey
  * Error is red

This is a replacement for Apple's old Reachability code.
