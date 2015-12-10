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
	let logger_class: Logger
    let mainAdUnitID = "ca-app-pub-4343476466504805/1804983774"
    var request_ads: Bool
    
    init() {
        devHelper = DevHelper()
		logger_class = Logger(default_log_level: LogLevel.testing, ref_class: "AdEngine")
        request_ads = devHelper.request_ads
    }
    
    func makeRequest(bannerView: GADBannerView, rootViewController: RootViewController) {
		let logger_function = Logger(default_log_level: LogLevel.testing, ref_class: "AdEngine", ref_function: "makeRequest(bannerView: GADBannerView, rootViewController: RootViewController)")
		logger_function.log("Google Mobile Ads SDK version: " + GADRequest.sdkVersion(), log_level: LogLevel.testing)
		
		
		bannerView.adSize = kGADAdSizeSmartBannerPortrait
        bannerView.adUnitID = mainAdUnitID
        bannerView.rootViewController = rootViewController
        let bannerRequest = GADRequest()
        bannerRequest.testDevices = [kGADSimulatorID];
        bannerView.loadRequest(bannerRequest)
    }

}