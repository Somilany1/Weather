//
//  Weather.swift
//  Weather
//
//  Created by Daria Bordyukova on 25.09.24.
//

import Foundation

struct Weather {
  let location: String
  let iconText: String
  let temperature: String

  let forecasts: [Forecast]
}
