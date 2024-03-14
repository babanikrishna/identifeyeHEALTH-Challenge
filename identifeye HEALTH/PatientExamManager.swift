//
//  PatientExamManager.swift
//  identifeye HEALTH
//
//  Created by Krishna Babani on 3/14/24.
//

import Foundation

// The PatientExamManager class is created to handle the processing of commands and manage patient and exam data.
class PatientExamManager {
    var patients: [String: Patient] = [:] // The patients property is declared as a mutable Dictionary to store patients, with the patient ID as the key and the Patient object as the value. This allows for efficient lookups by patient ID.
    
    func processCommand(_ command: String) {
        let components = command.split(separator: " ").map(String.init) // The command parameter splits into components using the space separator.
        
        guard let action = components.first else { // A guard statement is used to check if the command has at least one component (the action)
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
        guard components.count >= 3 else {
            print("Invalid ADD command format")
            return
        }
        
        let type = components[1]
        
        switch type {
        case "PATIENT":
            guard components.count >= 4 else {
                print("Invalid ADD PATIENT command format")
                return
            }
            
            let patientId = components[2]
            let name = components[3...].joined(separator: " ")
            
            if patients[patientId] == nil {
                patients[patientId] = Patient(id: patientId, name: name, exams: Set())
            } else {
                print("Patient with ID \(patientId) already exists")
            }
            
        case "EXAM":
            guard components.count >= 4 else {
                print("Invalid ADD EXAM command format")
                return
            }
            
            let patientId = components[2]
            let examId = components[3]
            
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
        guard components.count >= 3 else {
            print("Invalid DEL command format")
            return
        }
        
        let type = components[1]
        
        switch type {
        case "PATIENT":
            let patientId = components[2]
            
            if patients.removeValue(forKey: patientId) != nil {
                print("Patient with ID \(patientId) deleted")
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
            print("Name: \(patient.name), Id: \(patient.id), Exam Count: \(patient.exams.count)")
        }
    }
}
