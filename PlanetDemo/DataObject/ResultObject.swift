//
//  ResultObject.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    ResultObject is a data object which holds the subset of the data that is being hold by the PlanetObject
 */

import UIKit

class ResultObject: NSObject, NSCoding{

    var name : String?
    var rotation_period : String?
    var orbital_period : String?
    var diameter : String?
    var climate : String?
    var gravity : String?
    var terrain : String?
    var surface_water : String?
    var population : String?
    var residents : [String]?
    var films : [String]?
    var created : String?
    var edited : String?
    var url : String?
    
    
    
    required init(name:String, rotation_period:String,orbital_period: String,diameter: String,climate: String,gravity: String,terrain: String,surface_water: String,population: String,residents:[String],films: [String],created: String, edited: String,url: String) {
        self.name = name
        self.rotation_period = rotation_period
        self.orbital_period = orbital_period
        self.diameter = diameter
        self.climate = climate
        self.gravity = gravity
        self.terrain = terrain
        self.surface_water = surface_water
        self.population = population
        self.residents = residents
        self.films = films
        self.created = created
        self.edited = edited
        self.url = url
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        name = (aDecoder.decodeObject(forKey: "name") as! String)
        rotation_period = (aDecoder.decodeObject(forKey: "rotation_period") as! String)
        orbital_period = (aDecoder.decodeObject(forKey: "orbital_period") as! String)
        diameter = (aDecoder.decodeObject(forKey: "diameter") as! String)
        climate = (aDecoder.decodeObject(forKey: "climate") as! String)
        gravity = (aDecoder.decodeObject(forKey: "gravity") as! String)
        terrain = (aDecoder.decodeObject(forKey: "terrain") as! String)
        surface_water = (aDecoder.decodeObject(forKey: "surface_water") as! String)
        population = (aDecoder.decodeObject(forKey: "population") as! String)
        residents = (aDecoder.decodeObject(forKey: "residents") as! [String])
        created = (aDecoder.decodeObject(forKey: "created") as! String)
        edited = (aDecoder.decodeObject(forKey: "edited") as! String)
        url = (aDecoder.decodeObject(forKey: "url") as! String)
        films = (aDecoder.decodeObject(forKey: "films") as! [String])

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(rotation_period, forKey: "rotation_period")
        aCoder.encode(orbital_period, forKey: "orbital_period")
        aCoder.encode(diameter, forKey: "diameter")
        aCoder.encode(climate, forKey: "climate")
        aCoder.encode(gravity, forKey: "gravity")
        aCoder.encode(terrain, forKey: "terrain")
        aCoder.encode(surface_water, forKey: "surface_water")
        aCoder.encode(population, forKey: "population")
        aCoder.encode(residents, forKey: "residents")
        aCoder.encode(films, forKey: "films")
        aCoder.encode(created, forKey: "created")
        aCoder.encode(edited, forKey: "edited")
        aCoder.encode(url, forKey: "url")
    }
}
