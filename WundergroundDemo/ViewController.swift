//
//  ViewController.swift
//  WundergroundDemo
//
//  Created by TQL Mobile  on 2/2/18.
//  Copyright © 2018 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var dailyForecastImage: UIImageView!
    @IBOutlet weak var dailyForecastHighTempLabel: UILabel!
    @IBOutlet weak var dailyForecastLowTempLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }


}

//let url = URL(string: "https://google.com")!
//let task = URLSession.shared.dataTask(with: url){
//    data, response, error in
//
//    guard let data = data, error == nil
//        else { return }
//
//    let responseString = String(data: data, encoding: String.Encoding.utf8)
//    print(responseString ?? "--")
//}
//
//task.resume()

//let apiKey = "a8865fd6351f5b91"
//let baseURL = "http://api.wunderground.com"
//
//let city = "Cincinnati"
//let state = "OH"
//
//let forecastPath = "/api/\(apiKey)/forecast/q/\(state)/\(city).json"
//
//let forecastURL = URL(string: "\(baseURL)\(forecastPath)")!
//
//var urlRequest = URLRequest(url: forecastURL)
//urlRequest.httpMethod = "GET"
//urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//
//let forecastTask = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
//    guard let data = data, error == nil else { return }
//
//    let json = String(data: data, encoding: String.Encoding.utf8)
//    print(error)
//    print(json)
//}
//forecastTask.resume()

//https://www.wunderground.com/weather/api/d/docs?d=resources/phrase-glossary&MR=1&_ga=2.38960426.881120169.1517575377-1431911605.1517575377
//https://icons.wxug.com/i/c/v4/clear.svg
//https://github.com/manifestinteractive/weather-underground-icons
