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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Hide Keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
    }
}
