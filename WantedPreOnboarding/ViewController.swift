//
//  ViewController.swift
//  WantedPreOnboarding
//
//  Created by Susan Kim on 2022/09/06.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArr = [CityWeatherCellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "날씨"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(ListFetchUpdateNotification), object: nil)
        
        fetchData()
    }
    
    func fetchData() {
        WeatherManager.shared.fetchWeatherData()
    }
    
    @objc func reloadData() {
        dataArr = WeatherManager.shared.weatherData.compactMap { (cityName, weatherData) in
            CityWeatherCellData(cityName: cityName,
                                imageUrlString: weatherData.weather.first?.icon ?? "",
                                temperature: Double(weatherData.main.temp)
            )
        }
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as? CityWeatherCell else {
            return UITableViewCell()
        }
        
        let data = dataArr[indexPath.row]
        cell.weatherIconImageView.image = UIImage(systemName: data.imageUrlString)
        cell.cityNameLabel.text = data.cityName
        cell.temperatureLabel.text = "\(String(format: "%.1f", data.temperature))℃"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

