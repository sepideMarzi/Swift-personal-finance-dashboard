
//
//  Reportable.swift
//

import Foundation

// Fulfills Requirement: Custom Protocol (1 pt)
// - This protocol can be adopted by any class or struct.
// - It requires the conforming type to implement a method that returns a String.
protocol Reportable {
    func generateReport() -> String
}
