//
//  ViewController.swift
//  Weather
//
//  Created by Daria Bordyukova on 19.09.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var getWeatherButton: UIButton!
    @IBOutlet var cityDropDown: UIButton!
    @IBOutlet var buttonShow: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var cities = [String: [String: Double]]()
    var city:[String] = []
    
    override func viewDidLoad() {
        setData()
        super.viewDidLoad()
        getWeatherButton.addTarget(self, action: #selector(didTapGetWeatherButton), for: .touchUpInside)
        tableView.isHidden = true
    }
    
    @IBAction func onClickDropButton(_ sender: Any) {
        if tableView.isHidden {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
    }
    
    @IBAction func onClickShow(_ sender: Any) {
        if label.isHidden {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
    }
    
    func animate (toogle: Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = false
            }
        } else { UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = true
        }
        }
    }
    
    func setData() {
        city = Array(cities.keys)
    }
        
    @objc func didTapGetWeatherButton() {
            let selectedCity = cityDropDown.title(for: .normal)

            if let city = selectedCity {
                if let cityCoordinates = cities[city] {
                    if let latitude = cityCoordinates["latitude"], let longitude = cityCoordinates["longitude"] {
                        let query = "latitude=\(latitude)&longitude=\(longitude)"
                        let urlString = "https://api.open-meteo.com/v1/forecast?\(query)&current_weather=true"

                        let url = URL(string: urlString)!
                        let request = URLRequest(url:url)
                        
                        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                            if let data, let weather = try? JSONDecoder().decode(WeatherData.self, from: data) {
                                DispatchQueue.main.async {
                                    self.weatherLabel.text = "\(weather.currentWeather.temperature) °"
                                }
                            } else {
                                print("Fail!")
                            }
                        }
                        task.resume()
                    } else {
                        print("Coordinates not found.")
                    }
                }
            }
        }
    }
    
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView (_ tableView: UITableView, numberOfRowsInSection:Int) -> Int {
            cityDropDown.setTitle("\(city[0])", for: .normal)
            return city.count
        }
        func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = city[indexPath.row]
            return cell
        }
        
        func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            cityDropDown.setTitle("\(city[indexPath.row])", for: .normal)
            animate(toogle: false)
        }
    }
    
    
