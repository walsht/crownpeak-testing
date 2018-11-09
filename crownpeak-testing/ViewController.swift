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
        
        let pvc = PrivacyViewController()
        pvc.view.backgroundColor = .clear
        pvc.modalPresentationStyle = .overCurrentContext
        self.present(pvc, animated: false, completion: nil)
    }
}

public class PrivacyViewController: UIViewController {

    var hasCalled = false
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.isOpaque = false
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !hasCalled {
            hasCalled = true
            AppNoticeSDK.sharedInstance().showConsentFlowWith(onClose: { [weak self] (result, trackers) in
                self?.finishUp()
                }, presenting:self, repeatEvery30Days:false)
        } else {
            finishUp()
        }
    }
    
    func finishUp(){
        dismiss(animated: false, completion: nil)
    }
}
