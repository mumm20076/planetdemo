//
//  PlanetViewModel.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    PlanetViewModel is the architecture component and responsible for the any business or view logic need to be performed before that can the present on the view layer.
 */

import UIKit

class PlanetViewModel: NSObject {
    
    // This method request the model layer to produce the data in the form of PlanetObject.
    class func requestPlanets(completion: @escaping (_ result: PlanetObject, _ success: Bool)->())  {
        PlanetModel.requestPlanets { (planetObject, success) in
            completion(planetObject, success)
        }
    }
    

}
