//
//  WeatherBuilder.swift
//  Weather
//
//  Created by Daria Bordyukova on 26.09.24.
//

import Foundation

struct WeatherBuilder {
  var location: String?
  var temperature: String?

  var forecasts: [Forecast]?

  func build() -> Weather {
    return Weather(location: location!,
                   temperature: temperature!,
                   forecasts: forecasts!)
  }
}
