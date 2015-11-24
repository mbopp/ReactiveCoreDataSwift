//
//  RestClient.swift
//  AlphaProcessCheck
//
//  Created by Michael Bopp on 11/23/15.
//  Copyright © 2015 Rapid Development Group. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ReactiveCocoa

class RestClient: NSObject {

  var sessionManager: Alamofire.Manager!
  let cookies = NSHTTPCookieStorage.sharedHTTPCookieStorage()
  
  private struct Constants {
    static let errorDomain = "RestDataClient"
  }

  func configureManager() -> Alamofire.Manager {
    // Create a shared URL cache
    let memoryCapacity = 500 * 1024 * 1024; // 500 MB
    let diskCapacity = 500 * 1024 * 1024; // 500 MB
    let cache = NSURLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "shared_cache")
    let defaultHeaders = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders
    
    let cfg = NSURLSessionConfiguration.defaultSessionConfiguration()
    cfg.HTTPCookieStorage = cookies
    cfg.HTTPAdditionalHeaders = defaultHeaders
    cfg.requestCachePolicy = .UseProtocolCachePolicy // this is the default
    cfg.URLCache = cache
    cfg.HTTPMaximumConnectionsPerHost = 5
    
    return Alamofire.Manager(configuration: cfg)
  }
  
  override init() {
    super.init()
    sessionManager = configureManager()
  }

  
  
}
