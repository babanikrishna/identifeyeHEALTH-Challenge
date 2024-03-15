//
//  PatientExamManager.swift
//  identifeye HEALTH
//
//  Created by Krishna Babani on 3/14/24.
//

import Foundation

// The PatientExamManager class is created to handle the processing of commands and manage patient and exam data.
class PatientExamManager {
    var patients: [String: Patient] = [:] // The patients property is declared as a mutable Dictionary to store patients, with the patient ID as the key and the Patient object as the value.
    
    func processCommand(_ command: String) {
        let components = command.split(separator: " ").map(String.init) // The command parameter splits into components using the space separator.
        
        guard let action = components.first else { // We are checking if the command has at least one component (the action)
            print("Invalid command format")
            return
        }
        
        switch action { // A switch statement here determines the appropriate function to call based on the action (ADD or DEL)
        case "ADD":
            handleAddCommand(components: components)
        case "DEL":
            handleDelCommand(components: components)
        default:
            print("Unsupported command")
        }
    }
    
    private func handleAddCommand(components: [String]) {
        
        // Checking if the command has at least 4 components.
        // The given format is: ADD (index 0) PATIENT/EXAM (index 1) patientId (index 2) [examId/name] (index 3 or ...).
        guard components.count >= 4 else {
            print("Invalid ADD command format")
            return
        }
        
        let type = components[1] // Extracting the type of data user types or added into the file to later check for 'PATIENT' & 'EXAM'
        
        switch type {
        case "PATIENT":
            let patientId = components[2]
            let name = components[3...].joined(separator: " ")
            
            // Checking if the patient with the given ID exists, if not will create a new patient profile
            if patients[patientId] == nil {
                patients[patientId] = Patient(id: patientId, name: name, exams: Set()) // Create a new patient and adding it
            } else {
                // print("Patient with ID \(patientId) already exists")
            }
            
        case "EXAM":
            let patientId = components[2]
            let examId = components[3]
            
            // Checking if the patient exists
            if var patient = patients[patientId] {
                patient.exams.insert(examId)
                patients[patientId] = patient
            } else {
                print("Patient with ID \(patientId) not found")
            }
            
        default:
            print("Unsupported ADD command")
        }
    }
    
    private func handleDelCommand(components: [String]) {
        
        // Following up the same logic as handleAddCommand() function
        guard components.count >= 3 else {
            print("Invalid DEL command format")
            return
        }
        
        let type = components[1]
        
        switch type {
        case "PATIENT":
            let patientId = components[2]
            
            // Checking if the patient exists
            if patients.removeValue(forKey: patientId) != nil {
                // print("Patient with ID \(patientId) deleted")
            } else {
                print("Patient with ID \(patientId) not found")
            }
            
        case "EXAM":
            let examId = components[2]
            
            for (patientId, patient) in patients where patient.exams.contains(examId) {
                patients[patientId]?.exams.remove(examId)
                print("Exam with ID \(examId) deleted from patient \(patientId)")
            }
            
        default:
            print("Unsupported DEL command")
        }
    }
    
    func printSummary() {
        for patient in patients.values {
            print("Name: \(patient.name), Id: \(patient.id), Exam Count: \(patient.exams.count)") // Printing it as per the given format
        }
    }
}
