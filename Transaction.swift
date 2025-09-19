
//
//  Transaction.swift
//

import Foundation

// Fulfills Requirement: Transaction Struct (2 pts)
// - It's a struct.
// - It conforms to Identifiable and Equatable.
// - It has a computed property 'isExpense'.
//
// Also Fulfills:
// - Conforms to the custom 'Reportable' protocol.
struct Transaction: Identifiable, Equatable, Reportable {
    let id: UUID
    let date: Date
    let description: String
    let amount: Double
    let type: TransactionType

    // Fulfills Requirement: Computed Property
    var isExpense: Bool {
        return type == .expense
    }

    // Initializer to create new transactions
    init(id: UUID = UUID(), date: Date = Date(), description: String, amount: Double, type: TransactionType) {
        self.id = id
        self.date = date
        self.description = description
        self.amount = amount
        self.type = type
    }

    // Fulfills Requirement: Equatable Conformance
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id
    }

    // Fulfills Requirement: Reportable Conformance
    func generateReport() -> String {
        let formattedDate = date.formatted(date: .abbreviated, time: .omitted)
        return "On \(formattedDate), \(description) (\(type.rawValue)): $\(String(format: "%.2f", amount))"
    }
}
