//
//  main.swift
//  identifeye HEALTH
//
//  Created by Krishna Babani on 3/13/24.
//

import Foundation

func processFile(atPath path: String) {
    do {
        let manager = PatientExamManager()
        let data = try String(contentsOfFile: path, encoding: .utf8)
        let commands = data.split(separator: "\n").map(String.init)
        for command in commands {
            manager.processCommand(command)
        }
        manager.printSummary()
    } catch {
        print("Failed to read file: \(error)")
    }
}

let filePath = "input.txt"
processFile(atPath: filePath)
