//
//  ViewController.swift
//  PlanetDemo
//
//  Created by Praveen Sharma on 04/01/19.
//  Copyright © 2019 Planet. All rights reserved.
//

/*
    ViewController is an architecture component which is responsible for displaying the and controlling the UI transaction made during the user interactions and consumer usability.
 */

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet var tblViewPlanets: UITableView!
    var results = [ResultObject]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if PlanetUtils.isConnectedToNetwork() {
            // This piece of code execute if there is internet working on device
            self.getPlanets();
        }else{
            self.indicator.isHidden = true;
            if UserDefaults.standard.value(forKey: Constant.Keys.planetResult) != nil {
                let decoded  = UserDefaults.standard.value(forKey: Constant.Keys.planetResult) as! Data
                results = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [ResultObject]
                tblViewPlanets.reloadData();
            }
            let alert = UIAlertController(title: Constant.Strings.error, message: Constant.Strings.checkNetwork, preferredStyle: UIAlertController.Style.actionSheet)
            let dismiss = UIAlertAction(title: Constant.Strings.OK, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(dismiss)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: Get the list of Planets
    // This is the method which request the viewmodel for Planet data and update the UI component according to it.
    func getPlanets() {
        indicator.startAnimating()
        self.indicator.isHidden = false;
        PlanetViewModel.requestPlanets(completion:{ (planetResults, success) in
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.indicator.isHidden = true;
            }
            if (success){
                self.results = planetResults.results!
                DispatchQueue.main.async {
                    self.tblViewPlanets.reloadData()
                }
            }else{
                let alert = UIAlertController(title: Constant.Strings.error, message: Constant.Strings.wentWrong, preferredStyle: UIAlertController.Style.actionSheet)
                let dismiss = UIAlertAction(title: Constant.Strings.OK, style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
   
    // MARK: Table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return results.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = results[indexPath.row].name;
        return cell;
    }

}

