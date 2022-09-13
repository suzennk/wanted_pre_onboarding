//
//  File.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/14.
//

import Foundation

/**
 {
     "id": 1841808,
     "name": "Gwangju",
     "state": "",
     "country": "KR",
     "coord": {
         "lon": 126.916672,
         "lat": 35.166672
     }
 }
 */
struct City: Decodable {
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: Coordinate
}

struct Coordinate: Decodable {
    let lon: Double
    let lat: Double
}
