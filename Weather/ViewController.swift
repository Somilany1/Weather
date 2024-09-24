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
    @IBOutlet weak var cityDropDown: UIButton!
    @IBOutlet weak var buttonShow: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var city = ["City", "City2", "City3"]
    
    override func viewDidLoad() {
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
        
        
    @objc func didTapGetWeatherButton() {
            let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true"
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
        }
    }
    
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView (_ tableView: UITableView, numberOfRowsInSection:Int) -> Int {
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
    
    
