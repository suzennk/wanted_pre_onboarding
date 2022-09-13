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
    let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&units=metric&appid={API key}"

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
     city.list.json으로부터 index, name 매핑되어있는 정보 불러와 supportedCityList에 저장
     */
    private init() {
        guard let path = Bundle.main.path(forResource: "city.list", ofType: "json"),
              let jsonString = try? String(contentsOfFile: path),
              let jsonData = jsonString.data(using: .utf8) else {
            self.supportedCityList = []
            return
        }
        self.supportedCityList = try! JSONDecoder().decode([City].self, from: jsonData)
    }
    
    func fetchWeatherData(for city: City, onComplete: @escaping ()->()) {
//        var urlString = currentWeatherUrl
//        urlString = urlString.replacingOccurrences(of: "{lat}", with: "\(city.latitude)")
//        urlString = urlString.replacingOccurrences(of: "{lon}", with: "\(city.longtitude)")
//        URLRequest(url: <#T##URL#>)
//        URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
}
