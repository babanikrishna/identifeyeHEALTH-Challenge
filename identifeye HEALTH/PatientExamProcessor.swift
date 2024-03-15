//
//  PatientExamProcessor.swift
//  identifeye HEALTH
//
//  Created by Krishna Babani on 3/13/24.
//

import Foundation

@main
struct PatientExamProcessor {
    static func main() {
        let filePath = "input.txt" // // Specifying the path of the input file
        processFile(atPath: filePath) // Calling the processFile function with the file path
    }
    
    static func processFile(atPath path: String) {
        do {
            let manager = PatientExamManager() // Creating an instance of the PatientExamManager class
            let data = try String(contentsOfFile: path, encoding: .utf8) // Reading the contents of the file at the specified path
            let commands = data.split(separator: "\n").map(String.init) // Splitting the file contents into individual commands
            for command in commands { // Processing each command using the PatientExamManager instance
                manager.processCommand(command)
            }
            manager.printSummary() // // Printing the summary of patients and their exam counts
        } catch {
            print("Failed to read file: \(error)")
        }
    }
}
