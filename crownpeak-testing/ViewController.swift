//
//  ViewController.swift
//  crownpeak-testing
//
//  Created by Tim Walsh on 11/7/18.
//  Copyright © 2018 Tim Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppNoticeSDK.sharedInstance().resetSDK()
        showConsentFlow()
    }
    
    func showExplicitConsentFlow(){
        AppNoticeSDK.sharedInstance().showExplicitConsentFlowWith(onClose: { (result, trackers) in
        }, presenting: self)
    }

    func showConsentFlow(){
        AppNoticeSDK.sharedInstance().showConsentFlowWith(onClose: { (result, trackers) in
        }, presenting: self, repeatEvery30Days: true)
    }
}
