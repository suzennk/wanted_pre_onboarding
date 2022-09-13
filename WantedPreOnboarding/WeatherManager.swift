//
//  WeatherManager.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/14.
//

import Foundation

class WeatherManager {
    static let shared = WeatherManager()
    
    let API_KEY = "707c35c4a1c94c67c6d4d6b1be90c29d"
    
    let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather"
//    "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&units=metric&appid={API key}"
//    "https://api.openweathermap.org/data/2.5/weather?id={city id}&units=metric&appid={API key}"

    let presetCityList = [
        "공주", "광주(전라남도)", "구미", "군산", "대구", "대전", "목포", "부산", "서산", "서울", "속초", "수원", "순천", "울산", "익산", "전주", "제주시", "천안", "청주", "춘천"
        ]

    let presetCityListEng = [
        "Gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Sokcho", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju City", "Cheonan", "Cheongju-si", "Chuncheon"
    ]
    
    /**
     앱에서 검색할 수 있는 City 배열... 추후 검색 기능 추가 검토
     */
    let supportedCityList: [City]
    
    /**
     supportedCityList에 대한 날씨 정보
     */
    var weatherData: [String: WeatherResponse]
    
    /**
     city.list.json으로부터 index, name 매핑되어있는 정보 불러와 supportedCityList에 저장
     */
    private init() {
        guard let path = Bundle.main.path(forResource: "city.list", ofType: "json"),
              let jsonString = try? String(contentsOfFile: path),
              let jsonData = jsonString.data(using: .utf8) else {
            self.supportedCityList = []
            self.weatherData = [:]
            return
        }
        self.supportedCityList = try! JSONDecoder().decode([City].self, from: jsonData)
        self.weatherData = [:]
    }
    
    func fetchWeatherData() {
        self.weatherData = [String: WeatherResponse]()
        let fetchCities = self.presetCityListEng.compactMap { cityName in
            supportedCityList.filter { $0.name == cityName }.first
        }
        fetchCities.forEach { city in
            var urlComponents = URLComponents(string: currentWeatherUrl)!
            let queryItems = [
                URLQueryItem(name: "id", value: "\(city.id)"),
                URLQueryItem(name: "appid", value: API_KEY),
                URLQueryItem(name: "units", value: "metric")]
            urlComponents.queryItems = queryItems
            
            guard let url = urlComponents.url else { return }
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else { return }
                guard let result = try? JSONDecoder().decode(WeatherResponse.self, from: data) else { return }
                self.weatherData[city.name] = result
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: ListFetchUpdateNotification), object: nil)
            }.resume()
        }
        
    }
}
