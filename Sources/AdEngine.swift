//
//  AdEngine.swift
//  Frequencies
//
//  Created by Corey Stewart on 12/9/15.
//  Copyright © 2015 Stewart Companies. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdEngine {
    let devHelper: DevHelper
    let mainAdUnitID = "ca-app-pub-4343476466504805/1804983774"
    var request_ads: Bool
    
    init() {
        devHelper = DevHelper()
        request_ads = devHelper.request_ads
    }
    
    func makeRequest(bannerView: GADBannerView, rootViewController: RootViewController) {
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = mainAdUnitID
        bannerView.rootViewController = rootViewController
        let bannerRequest = GADRequest()
        bannerRequest.testDevices = [kGADSimulatorID];
        bannerView.loadRequest(bannerRequest)
    }

}