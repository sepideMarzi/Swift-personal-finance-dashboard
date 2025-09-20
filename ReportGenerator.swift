

//
//  ReportGenerator.swift
//

import Foundation

//  This file provides a service for generating reports.
struct ReportGenerator {


    static func generateMasterReport(from items: [Reportable]) -> String {
        var masterReport = "" 

        masterReport += "========== MASTER REPORT ==========\n\n"

        for item in items {
            masterReport += item.generateReport()
            masterReport += "\n------------------------------------\n\n"
        }

        masterReport += "======== END OF MASTER REPORT ========"

        return masterReport
    }
}

