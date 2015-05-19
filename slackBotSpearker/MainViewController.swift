//
//  MainViewController.swift
//  slackBotSpearker
//
//  Created by Diogo Amaral on 5/18/15.
//  Copyright (c) 2015 Diogo Amaral. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var speakTextField: UITextField!
    @IBOutlet weak var sendSpeakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func speakButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("sendSpeakSegue", sender: self)
    }
    
    // MARK: Misc
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sendSpeakSegue" {
            let toView = segue.destinationViewController as! ConfirmSpeakViewController
            toView.speak = speakTextField.text
        }
    }

}
