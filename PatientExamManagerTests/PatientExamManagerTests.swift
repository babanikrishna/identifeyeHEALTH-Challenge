//
//  PatientExamManagerTests.swift
//  PatientExamManagerTests
//
//  Created by Krishna Babani on 3/14/24.
//

import XCTest

final class PatientExamManagerTests: XCTestCase {
    var manager: PatientExamManager!
    
    override func setUp() {
        super.setUp()
        manager = PatientExamManager()
    }
    
    override func tearDown() {
        manager = nil
        super.tearDown()
    }
    
    func testAddPatient() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        XCTAssertEqual(manager.patients.count, 1)
        XCTAssertNotNil(manager.patients["123"])
        XCTAssertEqual(manager.patients["123"]?.name, "JOHN DOE")
    }
    
    func testAddExistingPatient() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("ADD PATIENT 123 JANE SMITH")
        XCTAssertEqual(manager.patients.count, 1)
        XCTAssertEqual(manager.patients["123"]?.name, "JOHN DOE")
    }
    
    func testAddExam() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("ADD EXAM 123 E001")
        XCTAssertEqual(manager.patients["123"]?.exams.count, 1)
        XCTAssertTrue(manager.patients["123"]?.exams.contains("E001") ?? false)
    }
    
    func testAddExamForNonExistingPatient() {
        manager.processCommand("ADD EXAM 123 E001")
        XCTAssertEqual(manager.patients.count, 0)
    }
    
    func testAddDuplicateExam() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("ADD EXAM 123 E001")
        manager.processCommand("ADD EXAM 123 E001")
        XCTAssertEqual(manager.patients["123"]?.exams.count, 1)
    }
    
    func testDeletePatient() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("DEL PATIENT 123")
        XCTAssertEqual(manager.patients.count, 0)
    }
    
    func testDeleteNonExistingPatient() {
        manager.processCommand("DEL PATIENT 123")
        XCTAssertEqual(manager.patients.count, 0)
    }
    
    func testDeleteExam() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("ADD EXAM 123 E001")
        manager.processCommand("DEL EXAM E001")
        XCTAssertEqual(manager.patients["123"]?.exams.count, 0)
    }
    
    func testDeleteNonExistingExam() {
        manager.processCommand("ADD PATIENT 123 JOHN DOE")
        manager.processCommand("DEL EXAM E001")
        XCTAssertEqual(manager.patients["123"]?.exams.count, 0)
    }
    
    func testProcessMultipleCommands() {
        let commands = [
            "ADD PATIENT 123 JOHN DOE",
            "ADD PATIENT 456 JANE SMITH",
            "ADD EXAM 123 E001",
            "ADD EXAM 123 E002",
            "ADD EXAM 456 E003",
            "DEL EXAM E002",
            "DEL PATIENT 456"
        ]
        
        for command in commands {
            manager.processCommand(command)
        }
        
        XCTAssertEqual(manager.patients.count, 1)
        XCTAssertEqual(manager.patients["123"]?.exams.count, 1)
    }
}

