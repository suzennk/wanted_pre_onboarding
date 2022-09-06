//
//  CityWeatherCellData.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/06.
//

import UIKit

struct CityWeatherCellData {

    let cityName: String
    let imageUrlString :String
    let temperature: Double
    
}

class CityWeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
}
