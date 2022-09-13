//
//  WeatherResponse.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/14.
//

import Foundation

struct WeatherResponse: Decodable {
    let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: MainInfo
    let visibility: Int
    let wind: Wind
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct MainInfo: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}
