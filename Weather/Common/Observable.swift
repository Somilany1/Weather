//
//  Observable.swift
//  Weather
//
//  Created by Daria Bordyukova on 26.09.24.
//

import Foundation

class Observable<T> {
  typealias Observer = (T) -> Void
  var observer: Observer?

  func observe(_ observer: Observer?) {
    self.observer = observer
    observer?(value)
  }

  var value: T {
    didSet {
      observer?(value)
    }
  }

  init(_ value: T) {
    self.value = value
  }
}
