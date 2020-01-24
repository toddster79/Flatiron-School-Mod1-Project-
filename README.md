# Course Scheduler
***
## Version Information
Version 1.0 - Initial Version
***
Flatiron Module 1 CLI Course Scheduler by:
* Doug Johnson
* Todd Carlson

The Course Scheduler allows course scheduling for teachers and students.  Students are able to see personal course attendance information.  Teachers are able to administrate students, courses, and course assignments.

***
## Assumptions and Limitations
Password functionality does not function.

***
## Installation
To install the application fork and clone the application from the following GitHub location:   
github.com/toddster79/Flatiron-School-Mod1-Project-

***
## Running the Application
To run the application from the command line, navigate to the top level directory and run `$ ruby app.rb`.

### Select a User Type and User
1. Select either `Student` or `Teacher`
1. Select a user from the corresponding list of users

### Application Commands
Once a user has been selected, depending on the user type, the user will be able to execute one of the functions from the corresponding list below.  The user will be able to execute commands until the `Quit` command is selected.

A `Student` is able to:
* `List Required Course` - See courses they are schedule to attend
* `List Missed Courses` - See courses they have missed attending
* `List Completed Course` - See courses they have already completed
* `List Classmates` - See other student in their class
* `SWITCH USER` - Switch to a different user
* `QUIT` - Quit the application

A `Teacher` is able to:
* `List All Students` - List all of the students in the system 
* `Add a Student` - Add a student to the system
* `List All Courses` - List all courses in the past and future
* `List My Courses` - List all courses in the past and future they have taught or will be teaching
* `Add a Course` - Add a course to the system
* `List All Course Assignments` - List all of the assignments for a student to a course
* `Create a Course Assignment` - Create a course assigment for a course for one or more students
* `Delete a Course Assignment` - 
* `Mark Attendance` - Mark course completion for a course assignment for one student and a course
* `List Missed Course Assignment` - List all of the assignements for course that have passed where the student was not marked as in attendance
* `SWITCH USER` - Switch to a different user
* `QUIT` - Quit the application