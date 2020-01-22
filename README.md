# Course Scheduler
***
Flatiron Module 1 CLI project by:
Doug Johnson
Todd Carlson

The Course Scheduler is a super great application for...

***
## Installation
To install the application, go to GitHub and ....

***
## Running the Application
To run the application type `$ ruby ...`

***
## Application Commands
The following user roles are not enfoced by the application.

A teacher is able to:
1. ACTIVE RECORD - Add a student
    `Student.new`
    `=> New student added`
1. Remove a student
    `student#drop`
    `=> Student removed from database`
1. Add a course
    ` `
    ` `
1. Remove a course
    ` `
    ` `
1. Create a course assignement for one student (***v1*** one or more students)
    `Student_course.teacher_assign_course(Student, Course, status="Incomplete"`)
    `=> new student_course assignment created`
1. Mark students attendance to a course
    `course#mark_attendance(Course, students[])`
    `=> student_course.status = 'Complete'`
1. DONE - See the courses they are teaching
    `Course.teacher_courses(teacher_name)`
    `=> Listing of courses a teacher is teaching today or in the future`
1. See students who have not attended one of their classes
    `course#teacher_missed_courses(teacher_name)`
    `=> Listing of student and course information missed for a teacher`

A student is able to:
1. SKELETON See required course(s) and see information about the course (e.g., teacher, time, etc.)
    `student#required_courses`
    `=> Listing of courses`
1. SKELETON See courses they have missed
    `student#missed_courses`
    `=> Listing of courses that have missed`
1. SKELETON See courses they have already completed
    `student#completed_courses`
    `=> Lisitng of courses completed`
1. SKELETON See other student required to take the course (***v1***)
    `student#classmates(course) `
    `=> Listing of classmates for a given course`
1. SKELETON See courses for today
    `student#courses_today()`
    `=> Listing of courses for today`

## Tables
    students
    t.string "name"

    student_course
    t.integer "student_id"
    t.integer "course_id"
    t.string "status"

    course
    t.string "teacher_name"
    t.string "subject"
    t.string "date_time"

1 to many to 1

has_many :blahs
has_many :blah.through blahs

many join
belongs_to :blah1
belongs_to :blah2
