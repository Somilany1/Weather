//
//  WeatherServiceProtocol.swift
//  Weather
//
//  Created by Daria Bordyukova on 28.09.24.
//

import Foundation
import CoreLocation

typealias WeatherCompletionHandler = (Weather?, SWError?) -> Void

protocol WeatherServiceProtocol {
  func retrieveWeatherInfo(_ location: CLLocation, completionHandler: @escaping WeatherCompletionHandler)
}
