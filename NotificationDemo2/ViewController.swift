//
//  ViewController.swift
//  NotificationDemo2
//
//  Created by Emily Lien on 12/2/15.
//  Copyright © 2015 EmilyLien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"drawAShape:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        
        
        let notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Hi, I am a notification"
        notification.fireDate = NSDate(timeIntervalSinceNow: 3) //will fire 3 seconds after app is launched, as opposed to hardcoding a date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func drawAShape(notification:NSNotification){
        let view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
        
    }
    
    func showAMessage(notification:NSNotification){
        let message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Hello there", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

