

//
//  main.swift
//

import Foundation

class FinanceApp {
    // 'accounts' is a variable array because we might add/remove accounts in the future.
    private var accounts: [Account] = []
    private var shouldQuit = false

    // 1. SETUP
    func setupSampleData() {
        print("Setting up sample accounts...")
        // Use 'let' for constants that won't change after creation.
        let checking = CheckingAccount(name: "Main Checking", initialBalance: 1500.00)
        let savings = SavingsAccount(name: "Vacation Fund", initialBalance: 500.00, interestRate: 0.02)

        // Add some transactions
        checking.addTransaction(description: "Paycheck", amount: 2200.00, type: .income)
        checking.addTransaction(description: "Groceries", amount: 150.75, type: .expense)
        checking.addTransaction(description: "Rent", amount: 1200.00, type: .expense)

        savings.addTransaction(description: "Initial Deposit", amount: 500.00, type: .income)
        savings.addTransaction(description: "Concert Tickets", amount: 250.00, type: .expense)

        // Apply interest to the savings account
        savings.applyInterest()

        accounts = [checking, savings]
        print("Sample data created.\n")
    }

    // 2. MAIN APP LOOP
    func run() {
        setupSampleData()

        while !shouldQuit {
            printMenu()
            handleUserInput()
        }
    }

    // Fulfills Requirement: Functions (with no parameters or return)
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

    // Fulfills Requirement: Functions & Control Flow (switch)
    func handleUserInput() {
        // Fulfills Requirement: Optionals Handling (if let)
        if let choice = readLine() {
            print("\n") // Add a newline for better formatting
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
        print("\n") // Add spacing before the next menu
    }

    // 3. MENU ACTIONS

    func listAllAccounts() {
        print("--- Your Accounts ---")
        for account in accounts {
            // Here we call the overridden method for each account type
            print(account.displayDetails())
        }
        print("---------------------")
    }

    // Fulfills Requirement: Optionals Handling (guard let)
    func viewAccountDetails() {
        print("Enter the name of the account to view:", terminator: " ")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name. Returning to menu.")
            return
        }

        // Fulfills Requirement: Functions (returning an optional)
        if let account = findAccount(byName: name) {
            print(account.generateReport())
        } else {
            print("Account with name '\(name)' not found.")
        }
    }

    func generateMasterReport() {
        print("Generating master report for all accounts...")
        // Here we use our ReportGenerator service with our array of accounts.
        // This works because 'Account' conforms to the 'Reportable' protocol.
        let report = ReportGenerator.generateMasterReport(from: accounts)
        print(report)
    }

    // 4. HELPER FUNCTIONS

    // Fulfills Requirement: Functions (with parameters and optional return)
    func findAccount(byName name: String) -> Account? {
        // Find the first account where the name matches (case-insensitively)
        return accounts.first { $0.name.lowercased() == name.lowercased() }
    }
}

// 5. START THE APP
let app = FinanceApp()
app.run()

