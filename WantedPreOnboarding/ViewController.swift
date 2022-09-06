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
        
        reloadData()
    }
    
    func reloadData() {
        dataArr.removeAll()
        
        for country in Country.allCases {
            let cellData = CityWeatherCellData(
                cityName: country.rawValue,
                imageUrlString: "sun.haze.fill",
                temperature: Double.random(in: 1...100)
            )
            dataArr.append(cellData)
        }
        
        tableView.reloadData()
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

