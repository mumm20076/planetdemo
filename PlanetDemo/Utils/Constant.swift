//
//  Constant.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
 Constant is the global constant file while includes all the necessary strings used in the whole project.
 */

import UIKit

struct Constant {

    struct BaseUrls {
        static var url = "https://swapi.co/api/"
    }
    
    struct EndPoints {
        static var planets = "planets/"
    }
    
    struct Strings {
        static var checkNetwork = "Please check your internet connection"
        static var error = "Error!!"
        static var OK = "OK"
        static var wentWrong = "Something went wrong!"
    }
    
    struct Keys {
        static var planetResult = "PlanetResults"
    }

}
