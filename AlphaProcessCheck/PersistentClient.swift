//
//  PersistentClient.swift
//  AlphaProcessCheck
//
//  Created by Michael Bopp on 11/23/15.
//  Copyright © 2015 Rapid Development Group. All rights reserved.
//

import CoreData
import ReactiveCocoa
import SwiftyJSON

class PersistentClient: NSObject {

  lazy var stack : CoreDataStack = CoreDataStack(
    modelName:"ConstructionHelicopters",
    storeName:"ConstructionHelicopters",
    options:[
      NSMigratePersistentStoresAutomaticallyOption: true,
      NSInferMappingModelAutomaticallyOption: true
    ])
  
}
