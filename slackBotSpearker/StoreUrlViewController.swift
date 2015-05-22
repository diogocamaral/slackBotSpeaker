//
//  StoreUrlViewController.swift
//  slackBotSpearker
//
//  Created by Diogo Amaral on 5/19/15.
//  Copyright (c) 2015 Diogo Amaral. All rights reserved.
//

import UIKit

class StoreUrlViewController: UIViewController {

    @IBOutlet weak var storeUrlButton: UIButton!
    @IBOutlet weak var urlTextView: UITextView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = defaults.stringForKey("slackUrl") {
            urlTextView.text = urlString
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func storeUrlButtonDidTouch(sender: AnyObject) {
        defaults.setObject(urlTextView.text, forKey: "slackUrl")
    }
    
    // Hide Keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }
}
