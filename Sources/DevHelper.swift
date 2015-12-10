//
//  DevHelper.swift
//  Frequencies
//
//  Created by Corey Stewart on 12/9/15.
//  Copyright © 2015 Stewart Companies. All rights reserved.
//

import Foundation


/*
    App Status Difference

    development: logger_dev = true, logger_test = true, logger_production, panel_dev = true, panel_test = true

    testing: logger_test = true,

*/

enum AppDevStatus {
    case development, testing, production, production_ad_free, production_contributors_privilege
}

enum LogLevel {
    case development, testing, production
}

struct Logger {
    var default_log_level: LogLevel
    var ref_class: String
    var ref_function: String
    private var devHelper: DevHelper
    
    init(default_log_level: LogLevel = LogLevel.development, ref_class: String = "", ref_function: String = "") {
        devHelper = DevHelper()
        self.default_log_level = default_log_level
        self.ref_class = ref_class
        self.ref_function = ref_function
		printHeader()
    }
    
    private func printHeader() {
		if ref_class != "" {
			if ref_function == "" {
				print("--- "+ref_class+" ---")
			}else{
				print(" : "+ref_function)
			}
		}
    }
    
    func log(body: AnyObject, var log_level: LogLevel?) {
        if (log_level == nil) {
            log_level = self.default_log_level
        }
        switch(self.devHelper.app_dev_status) {
        case AppDevStatus.development:
            print("    •", body)
            break
        case AppDevStatus.testing:
            if log_level == LogLevel.testing || log_level == LogLevel.production {
                print("    •", body)
            }
                break
        case AppDevStatus.production:
            if log_level == LogLevel.production {
				print(body)
				break
            }
        default:
			print(body)
			break
        }
    }
}

class DevHelper {
    var app_dev_status: AppDevStatus
    var log_level: LogLevel
    
    var panel_dev: Bool
    var panel_test: Bool
    
    var track_analytics: Bool
    
    var request_ads: Bool
    
    init () {
        app_dev_status = AppDevStatus.development
        
        log_level = LogLevel.development
        
        panel_dev = true
        panel_test = true
        
        track_analytics = true
        
        request_ads = true
    }
    
}