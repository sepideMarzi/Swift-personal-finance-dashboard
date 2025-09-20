
//
//  Transaction.swift
//

import Foundation


struct Transaction: Identifiable, Equatable, Reportable {
    let id: UUID
    let date: Date
    let description: String
    let amount: Double
    let type: TransactionType

    var isExpense: Bool {
        return type == TransactionType.expense
    }

    init(id: UUID = UUID(), date: Date = Date(), description: String, amount: Double, type: TransactionType) {
        self.id = id
        self.date = date
        self.description = description
        self.amount = amount
        self.type = type
    }

    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.id == rhs.id
    }

    func generateReport() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let formattedDate = formatter.string(from: date)
        return "On \(formattedDate), \(description) (\(type.rawValue)): $\(String(format: "%.2f", amount))"
    }
}
