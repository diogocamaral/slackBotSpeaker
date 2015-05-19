//
//  ConfirmSpeakViewController.swift
//  slackBotSpearker
//
//  Created by Diogo Amaral on 5/18/15.
//  Copyright (c) 2015 Diogo Amaral. All rights reserved.
//

import UIKit
import Alamofire

class ConfirmSpeakViewController: UIViewController {

    var speak = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func confirmSpeakButtonDidTouch(sender: AnyObject) {
        let parameter = speak
        
        let urlString = "https://gettydata.slack.com/services/hooks/slackbot?token=rtdMpsoM45xZgZ4io88oc5kx&channel=%23general"
        let nsurl = NSURL(string: urlString)!
        Alamofire.request(.POST, nsurl, parameters: [:], encoding: .Custom({
            (convertible, params) in
            var mutableRequest = convertible.URLRequest.copy() as! NSMutableURLRequest
            mutableRequest.HTTPBody = parameter.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            return (mutableRequest, nil)
        }))
    }
}
