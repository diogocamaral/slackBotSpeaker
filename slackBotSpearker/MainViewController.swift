//
//  MainViewController.swift
//  slackBotSpearker
//
//  Created by Diogo Amaral on 5/18/15.
//  Copyright (c) 2015 Diogo Amaral. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var speakTextField: UITextField!
    @IBOutlet weak var sendSpeakButton: UIButton!
    @IBOutlet weak var storeUrlButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func speakButtonDidTouch(sender: AnyObject) {
        let parameter = speakTextField.text
        
        // get url to send message
        let urlString = "https://gettydata.slack.com/services/hooks/slackbot?token=rtdMpsoM45xZgZ4io88oc5kx&channel=%23general"
        
        // transform url string in NSURL object
        let nsurl = NSURL(string: urlString)!
        
        // send a POST with Alamofire to the url with message
        Alamofire.request(.POST, nsurl, parameters: [:], encoding: .Custom({
            (convertible, params) in
            var mutableRequest = convertible.URLRequest.copy() as! NSMutableURLRequest
            mutableRequest.HTTPBody = parameter.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            return (mutableRequest, nil)
        }))
        
        // empty the text field
        speakTextField.text = ""
        
        alertMessage("Message Confirmation", message: "Message was sent", btnText: "Dismiss")
        
    }
    
    @IBAction func storeUrlButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("storeUrlSegue", sender: self)
    }
    
    // MARK: Functions
    
    // Alerts
    func alertMessage(title: String, message: String, btnText: String) {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: btnText, style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // Hide Keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }

}
