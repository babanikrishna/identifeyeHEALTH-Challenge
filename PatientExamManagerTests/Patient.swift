//
//  Patient.swift
//  identifeye HEALTH
//
//  Created by Krishna Babani on 3/14/24.
//

import Foundation

// The Patient struct is defined to encapsulate patient-related data, as per the requirement to store data in memory.
struct Patient {
    let id: String
    let name: String
    var exams: Set<String> // The exams property is declared as a mutable Set to store unique exam IDs for each patient.
}
