//
//  WeatherViewController.swift
//  BLKitPOC
//
//  Created by Burton Lee on 10/14/16.
//  Copyright © 2016 Buffalo Ladybug LLC. All rights reserved.
//

import UIKit
import BLKit

class WeatherViewController: BLViewController
{
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [Weather]()
    let api = (UIApplication.shared.delegate as! AppDelegate).weatherAPI
    weak var task: URLSessionDataTask?
    
    // MARK: - Init / Deinit
    
    deinit
    {
        if let t = task
        {
            t.cancel()
        }
        
        print("Weather VC deinit")
    }
    
    // MARK: - UIViewController
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.fetchData()
    }
    
    // MARK: - BLKit Data Handling
        
    override func fetchData()
    {
        task = self.api.getSFWeather(success: self.mkSuccess(), failure: mkFailure())
    }
    
    override func display(data: [AnyObject])
    {
        self.data = data as! [Weather];
        self.tableView.reloadData()
    }
    
    override func display(error: Error?)
    {
        self.data = [Weather(conditions: error?.localizedDescription ?? "Error", icon_url: "")]
        self.tableView.reloadData()
    }
}

extension WeatherViewController: UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let model = self.data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        cell.conditionsLabel.text = model.conditions
        cell.urlLabel.text = model.icon_url
        
        return cell
    }
}
