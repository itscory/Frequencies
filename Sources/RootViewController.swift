//
//  RootViewController.swift
//  FrequenciesPro
//
//  Created by Corey Stewart on 12/9/15.
//  Copyright © 2015 Stewart Companies. All rights reserved.
//

import UIKit
import GoogleMobileAds

class RootViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
        let adEngine = AdEngine()
        adEngine.makeRequest(bannerView, rootViewController: self)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

