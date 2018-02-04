//
//  ViewController.swift
//  WundergroundDemo
//
//  Created by TQL Mobile  on 2/2/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var currentConditionImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    let apiKey = "a8865fd6351f5b91"
    let baseURLString = "https://api.wunderground.com"
    let city = "Cincinnati"
    let state = "OH"
    
    var forecastArray = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshWeatherConditions(self)
    }
    
    @IBAction func refreshWeatherConditions(_ sender: Any) {
        forecastArray.removeAll()
        loadCurrentCondition()
        loadForecast()
    }
    
    func loadCurrentCondition() {
        
        let currentConditionURL = URL(string: "\(baseURLString)/api/\(apiKey)/conditions/q/\(state)/\(city).json")!
        
        let task = URLSession.shared.dataTask(with: currentConditionURL){ data, response, error in
            
            guard let data = data, error == nil else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonRootDict = json as? [String: Any] else { return }
            guard let currentObservation = jsonRootDict["current_observation"] as? [String: Any] else { return }
            
            if let currentTemp = currentObservation["temp_f"] as? Double, let icon =  currentObservation["icon"] as? String {
                
                DispatchQueue.main.async { [weak self] in
                    self?.currentTempLabel.text = "\(Int(currentTemp))F"
                    self?.currentConditionImage.image = UIImage(named: icon)
                }
            }
        }
        task.resume()
    }
    
    func loadForecast() {
        let forecastURL = URL(string: "\(baseURLString)/api/\(apiKey)/forecast/q/\(state)/\(city).json")!
        
        let task = URLSession.shared.dataTask(with: forecastURL){ [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonRootDict = json as? [String: Any] else { return }
            guard let forecastDict = jsonRootDict["forecast"] as? [String: Any] else { return }
            guard let simpleForecast = forecastDict["simpleforecast"] as? [String: Any] else { return }
            guard let forecastDayArray = simpleForecast["forecastday"] as? [[String: Any]] else { return }
            
            for f in forecastDayArray {
                guard let date = f["date"] as? [String: Any],
                    let weekday = date["weekday"] as? String,
                    let icon = f["icon"] as? String,
                    let highDict = f["high"] as? [String: String],
                    let fahrenheitHigh = highDict["fahrenheit"],
                    let lowDict = f["low"] as? [String: String],
                    let fahrenheitLow = lowDict["fahrenheit"]
                    else { return }
                self?.forecastArray.append(Forecast(forecastDay: weekday, icon: icon, high: fahrenheitHigh, low: fahrenheitLow))
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        task.resume()
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastTableViewCell
        
        let forecastDay = forecastArray[indexPath.row]
        cell.forecastDayOfWeekLabel.text = forecastDay.forecastDay
        cell.forecastConditionImage.image = UIImage(named: forecastDay.icon)
        cell.forecastHighTempLabel.text = forecastDay.high
        cell.forecastLowTempLabel.text = forecastDay.low
        return cell
    }
}
