//
//  PlanetObject.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    PlanetObject is a data object which holds the complete parsed data from the service
 */

import UIKit

class PlanetObject: NSObject {
    var count : Int?
    var next : String?
    var previous : Any?
    var results : [ResultObject]?  
}
