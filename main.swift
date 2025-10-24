

//
//  main.swift
//

import Foundation

class FinanceApp {
    private var accounts: [Account] = []
    private var shouldQuit = false

    func setupSampleData() {
        print("Setting up sample accounts...")
        let checking = CheckingAccount(name: "Main Checking", initialBalance: 1500.00)
        let savings = SavingsAccount(name: "Vacation Fund", initialBalance: 500.00, interestRate: 0.02)

        // Add some transactions
        checking.addTransaction(description: "Paycheck", amount: 2200.00, type: .income)
        checking.addTransaction(description: "Groceries", amount: 150.75, type: .expense)
        checking.addTransaction(description: "Rent", amount: 1200.00, type: .expense)

        savings.addTransaction(description: "Initial Deposit", amount: 500.00, type: .income)
        savings.addTransaction(description: "Concert Tickets", amount: 250.00, type: .expense)

        savings.applyInterest()

        accounts = [checking, savings]
        print("Sample data created.\n")
    }

    func run() {
        setupSampleData()

        while !shouldQuit {
            printMenu()
            handleUserInput()
        }
    }

    func printMenu() {
        print("====================================")
        print("What would you like to do?")
        print("1. List all accounts")
        print("2. View details for an account")
        print("3. Generate master report")
        print("4. Exit")
        print("====================================")
        print("Enter your choice:", terminator: " ")
    }

    func handleUserInput() {
        if let choice = readLine() {
            print("\n") 
            switch choice {
            case "1":
                listAllAccounts()
            case "2":
                viewAccountDetails()
            case "3":
                generateMasterReport()
            case "4":
                shouldQuit = true
                print("Thank you for using the Personal Finance App!")
            default:
                print("Invalid choice. Please try again.")
            }
        } else {
            print("\nCould not read input. Please try again.")
        }
        print("\n") 
    }


    func listAllAccounts() {
        print("--- Your Accounts ---")
        for account in accounts {
            print(account.displayDetails())
        }
        print("---------------------")
    }

    func viewAccountDetails() {
        print("Enter the name of the account to view:", terminator: " ")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name. Returning to menu.")
            return
        }

        if let account = findAccount(byName: name) {
            print(account.generateReport())
        } else {
            print("Account with name '\(name)' not found.")
        }
    }

    func generateMasterReport() {
        print("Generating master report for all accounts...")

        let report = ReportGenerator.generateMasterReport(from: accounts)
        print(report)
    }


    func findAccount(byName name: String) -> Account? {
        return accounts.first { $0.name.lowercased() == name.lowercased() }
    }
}

// 5. START THE APP
let app = FinanceApp()
app.run()

