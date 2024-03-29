# identifeye HEALTH - Challenge

This is a solution to the Software Engineering Internship challenge provided by identifeye HEALTH. The challenge requires creating a simple service that aggregates patient and exam data from a text file, processes the commands, and outputs a summary of the patients and their exam counts.

## Project Requirements

- The program should be able to read a `.txt` file that conforms to the specified format.
- The program should process the commands in the file and store the data in memory (without using a database).
- The program should output a summary of the patients, including their name, ID, and the number of exams associated with each patient.
- The program should handle edge cases and ignore invalid commands.
- The program should be well-structured, readable, and maintainable.
- The program should include test cases to demonstrate its functionality.

## Getting Started

To run the program, follow these steps:

1. Clone the repository or download the source code.

2. Open the project in Xcode.

3. Locate the `input.txt` file in the project navigator. This file contains the commands that the program will process. You can modify this file to include your own commands.

4. You will need to follow these steps to make sure Xcode reads input.txt:
   - Go to the "Product" menu in Xcode and select "Scheme" -> "Edit Scheme".
   - In the scheme editor, select the "Run" option on the left sidebar.
   - Go to the "Arguments" tab.
   - In the "Arguments Passed on Launch" section, click the "+" button to add a new argument.
   - Enter the path to your input file as the argument. For example: `/path/to/your/input.txt`.
   - Close the scheme editor.

5. Build and run the project using the "Product" -> "Run" menu or by pressing `Cmd + R`.

6. The program will read the commands from the specified input file, process them, and output the summary of patients and their exam counts in the Xcode console.

## Input File Format

The input file should contain one command per line. Each command should follow one of the following formats:

- Add a patient: `ADD PATIENT <patientId> <patientName>`
- Add an exam: `ADD EXAM <patientId> <examId>`
- Delete a patient: `DEL PATIENT <patientId>`
- Delete an exam: `DEL EXAM <examId>`

Replace `<patientId>`, `<patientName>`, and `<examId>` with the appropriate values.

## Edge Cases

The program handles the following edge cases:

- If a patient with the given identifier already exists when adding a patient, the command is ignored.
- If a patient with the given patient identifier does not exist when adding an exam, the command is ignored.
- If an exam with the given exam identifier already exists when adding an exam, the command is ignored.
- If a patient with the given identifier does not exist when deleting a patient, the command is ignored.
- If an exam with the given identifier does not exist when deleting an exam, the command is ignored.

## Unit Tests

The project includes a set of unit tests to verify the functionality of the program. The unit tests are located in the `PatientExamManagerTests` target within the Xcode project.

To run the unit tests:

1. Open the project in Xcode.

2. Select the `PatientExamManagerTests` scheme from the scheme dropdown in the top-left corner of the Xcode window.
3. Press `Cmd + U` or go to `Product -> Test` to run the unit tests.
4. The test results will be displayed in the Xcode test navigator.

The unit tests cover various scenarios and edge cases to ensure the correctness and reliability of the program. They test the functionality of adding and deleting patients and exams, as well as handling invalid commands and edge cases.

The unit tests are implemented using the XCTest framework and are automatically executed as part of the project's test suite. Each test case is defined as a separate test method within the `PatientExamManagerTests` class.

By running the unit tests, you can verify that the program behaves as expected and produces the correct output for different input scenarios.

Feel free to explore the `PatientExamManagerTests.swift` file to see the specific test cases and their implementations.

## Requirements

- Xcode 11 or later

## Code Ownership

This code is the property of Krishna Babani and is intended solely for the purpose of the identifeye HEALTH Software Engineering Internship challenge. Unauthorized use, reproduction, or distribution of this code is strictly prohibited.
