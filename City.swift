//
//  City.swift
//  Weather
//
//  Created by Daria Bordyukova on 28.09.24.
//

import Foundation

struct City {
    let name: String
    let latitude: Double
    let longitude: Double
}

let cities: [City] = [
    City(name: "Minsk", latitude: 53.9, longitude: 27.5667),
    City(name: "Grodno", latitude: 53.6697, longitude: 23.8298),
    City(name: "Gomel", latitude: 52.4345, longitude: 30.9754),
    City(name: "Vitebsk", latitude: 55.1904, longitude: 30.2049),
    City(name: "Mogilev", latitude: 53.9, longitude: 30.3456),
    City(name: "Brest", latitude: 52.0976, longitude: 23.7341)
]
