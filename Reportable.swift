
//
//  Reportable.swift
//

import Foundation

//this file defines a protocol named 'Reportable' with a single method 'generateReport()' that returns a string. and any cinforming type can generate a report string.
protocol Reportable {
    func generateReport() -> String
}
