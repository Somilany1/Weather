//
//  WeatherData.swift
//  Weather
//
//  Created by Daria Bordyukova on 19.09.24.
//

import Foundation

struct WeatherData: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentWeather: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentWeather = "current_weather"
    }
}

struct CurrentWeather: Codable {
    let time: String
    let temperature, windspeed: Double
    let winddirection, weathercode: Int
}

