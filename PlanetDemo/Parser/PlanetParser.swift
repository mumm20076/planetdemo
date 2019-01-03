//
//  PlanetParser.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    PlanetParser is responsible for parsing the response from the server and structure them into the necessary objects.
 */

import UIKit

class PlanetParser: NSObject {
    
    //MARK: Parse the complete json as PlanetObject
    func parseJson(jsonObject : [String:AnyObject]) -> PlanetObject{
        let planetObject = PlanetObject();
        planetObject.count = (jsonObject["count"] as! Int);
        planetObject.next = (jsonObject["next"] as! String);
        planetObject.previous = (jsonObject["previous"] as AnyObject);
        planetObject.results = self.parseResultJson(jsonObject: jsonObject["results"] as! [[String : AnyObject]]);
        return planetObject;
    }
    
    func parseResultJson(jsonObject : [[String:AnyObject]]) -> [ResultObject]{
        var arrResult = [ResultObject]();
        for object in jsonObject {
            let resultObject = ResultObject(name: "", rotation_period: "", orbital_period: "", diameter: "", climate: "", gravity: "", terrain: "", surface_water: "", population: "", residents: [""], films: [""], created: "", edited: "", url: "")
            resultObject.name = (object["name"] as? String);
            resultObject.rotation_period = (object["rotation_period"] as? String);
            resultObject.orbital_period = (object["orbital_period"] as? String);
            resultObject.diameter = (object["diameter"] as? String);
            resultObject.climate = (object["climate"] as? String);
            resultObject.gravity = (object["gravity"] as? String);
            resultObject.terrain = (object["terrain"] as? String);
            resultObject.surface_water = (object["surface_water"] as? String);
            resultObject.population = (object["population"] as? String);
            resultObject.residents = (object["residents"] as? [String]);
            resultObject.films = (object["films"] as? [String]);
            resultObject.created = (object["created"] as? String);
            resultObject.edited = (object["edited"] as? String);
            resultObject.url = (object["url"] as? String);
            
            arrResult.append(resultObject);
           
        }
        
        
        return arrResult;
    }
}
