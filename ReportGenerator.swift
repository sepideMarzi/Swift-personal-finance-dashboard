

//
//  ReportGenerator.swift
//

import Foundation

// This struct provides a service to generate reports from any collection of 'Reportable' items.
// This demonstrates the power of protocols for writing flexible and reusable code.
struct ReportGenerator {

    // This function takes an array of items conforming to the Reportable protocol
    // and generates a single, consolidated report string.
    static func generateMasterReport(from items: [Reportable]) -> String {
        var masterReport = "" // Start with an empty string

        masterReport += "========== MASTER REPORT ==========\n\n"

        // Loop through each item and append its individual report
        for item in items {
            masterReport += item.generateReport()
            masterReport += "\n------------------------------------\n\n"
        }

        masterReport += "======== END OF MASTER REPORT ========"

        return masterReport
    }
}

