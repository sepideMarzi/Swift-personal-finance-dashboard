

//
//  Account.swift
//

import Foundation

// Fulfills Requirement: Account Class Hierarchy (2 pts)
// - A base class 'Account'.
// - Two derived classes 'CheckingAccount' and 'SavingsAccount'.
// - Overridden methods/properties in the derived classes.
//
// Also Fulfills:
// - Conformance to the custom 'Reportable' protocol.

class Account: Reportable {
    let name: String
    var balance: Double
    var transactions: [Transaction]

    init(name: String, initialBalance: Double) {
        self.name = name
        self.balance = initialBalance
        self.transactions = []
    }

    func addTransaction(description: String, amount: Double, type: TransactionType) {
        let transaction = Transaction(description: description, amount: amount, type: type)
        transactions.append(transaction)
        if type == .income {
            balance += amount
        } else {
            balance -= amount
        }
    }

    // This method is intended to be overridden by subclasses
    func displayDetails() -> String {
        return "Account: \(name) | Balance: $\(String(format: ".2f", balance))"
    }

    // Fulfills Requirement: Reportable Conformance
    func generateReport() -> String {
        var report = "--- Report for \(name) ---\n"
        report += displayDetails() + "\n"
        report += "--- Transactions ---\n"
        if transactions.isEmpty {
            report += "No transactions.\n"
        } else {
            for transaction in transactions {
                report += transaction.generateReport() + "\n"
            }
        }
        return report
    }
}

class CheckingAccount: Account {
    // Override the displayDetails method to provide a custom description
    override func displayDetails() -> String {
        return "Checking Account: \(name) | Balance: $\(String(format: ".2f", balance))"
    }
}

class SavingsAccount: Account {
    let interestRate: Double

    init(name: String, initialBalance: Double, interestRate: Double) {
        self.interestRate = interestRate
        super.init(name: name, initialBalance: initialBalance)
    }

    func applyInterest() {
        let interestAmount = balance * interestRate
        addTransaction(description: "Interest Applied", amount: interestAmount, type: .income)
        print("Applied $\(String(format: ".2f", interestAmount)) interest to \(name).")
    }

    // Override displayDetails to include the interest rate
    override func displayDetails() -> String {
        let ratePercent = String(format: ".2f", interestRate * 100)
        return "Savings Account: \(name) | Balance: $\(String(format: ".2f", balance)) | Interest Rate: \(ratePercent)%"
    }
}

