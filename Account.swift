
import Foundation  


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
        if type == TransactionType.income {
            balance += amount
        } else {
            balance -= amount
        }
    }

    func displayDetails() -> String {
        return "Account: \(name) | Balance: $\(String(format: "%.2f", balance))"
    }

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
    override func displayDetails() -> String {
        return "Checking Account: \(name) | Balance: $\(String(format: "%.2f", balance))"
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
        print("Applied $\(String(format: "%.2f", interestAmount)) interest to \(name).")
    }

    override func displayDetails() -> String {
        let ratePercent = String(format: "%.2f", interestRate * 100)
        return "Savings Account: \(name) | Balance: $\(String(format: "%.2f", balance)) | Interest Rate: \(ratePercent)%"
    }
}

