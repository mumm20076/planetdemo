//
//  PlanetModel.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    PlanetModel is the architecture component and responsible for the all the transactions with data over the network and finally shape them in the most usable form by the view or viewmodel or any other consumers.
 */

import UIKit

class PlanetModel: NSObject {

    //MARK: Network Request to get the planet json
    class func requestPlanets(completion: @escaping (_ result: PlanetObject, _ success: Bool)->())  {
        let task = URLSession.shared.dataTask(with: NSURL(string: Constant.BaseUrls.url + Constant.EndPoints.planets)! as URL, completionHandler: { (data, response, error) -> Void in
            do{
                let str = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                let parserObject = PlanetParser();
                let planetObject = parserObject.parseJson(jsonObject: str);
                let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: planetObject.results! )
                UserDefaults.standard.set(encodedData, forKey: Constant.Keys.planetResult);
                completion(planetObject,true);
            }
            catch {
                completion(PlanetObject(),false);
            }
        })
        task.resume()
    }
    
}
