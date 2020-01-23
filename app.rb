require_relative "config/environment"

USER_TYPES = ["Student", "Teacher"]

STUDENT_MENU = [
    "List Required Course",
    "List Missed Courses",
    "List Completed Course",
    "List Classmates",
    "QUIT"
]

TEACHER_MENU = [
    "List All Students",
    "Add a Student",
    "List All Courses",
    "List My Courses",
    "Add a Course",
    "List All Course Assignments",
    "Create a Course Assignment",
    "Delete a Course Assignment"
    "Mark Attendance",
    "List Missed Course Assignment",
    "QUIT"
]

COURSE_ASSIGNMENT_STATES = [
    "Incomplete",
    "Complete",
]

user_data = {selected: false, user_type: nil, user_id: nil}
running = true
prompt = TTY::Prompt.new

puts "Welcome to the Course Machine."

while running
    if user_data[:selected]
        case user_data[:user_type]
        when USER_TYPES[0]
            command = prompt.select("What would you like to do #{Student.find(user_data[:user_id]).first_name}?", STUDENT_MENU, per_page: STUDENT_MENU.length)
            case command
            when "QUIT"
                running = false
            when "List Required Course"
                incomplete_course_assignments = Student.find(user_data[:user_id]).student_courses.where(status: "Incomplete")
                incomplete_courses = incomplete_course_assignments.map {|incomplete_course_assignment| incomplete_course_assignment.course}
                required_courses = incomplete_courses.select {|incomplete_course| incomplete_course.date_time >= Time.now.to_datetime}
                if required_courses.count > 0
                    Course.display_course_list_sorted(required_courses)
                else
                    puts "  You don't have any required courses."
                end
            when "List Missed Courses"
                incomplete_course_assignments = Student.find(user_data[:user_id]).student_courses.where(status: "Incomplete")
                incomplete_courses = incomplete_course_assignments.map {|incomplete_course_assignment| incomplete_course_assignment.course}
                missed_courses = incomplete_courses.select {|incomplete_course| incomplete_course.date_time < Time.now.to_datetime}
                if missed_courses.count > 0
                    Course.display_course_list_sorted(missed_courses)
                else
                    puts "  You don't have any missed courses."
                end
            when "List Completed Course"
                completed_courses_assignments = Student.find(user_data[:user_id]).student_courses.where(status: "Complete")
                completed_courses = completed_courses_assignments.map {|completed_course_assignment| completed_course_assignment.course}
                if completed_courses.count > 0
                    Course.display_course_list_sorted(completed_courses)
                else
                    puts "  You don't have any completed courses."
                end
            when "List Classmates"
                if Student.all.count > 0
                    Student.display_student_list_sorted(Student.all)
                else
                    puts "  You don't have any classmates."
                end
            else
                puts "Command \'#{command}\' not recognized."
            end
        when USER_TYPES[1]
            command = prompt.select("What would you like to do #{Teacher.find(user_data[:user_id]).first_name}?", TEACHER_MENU, per_page: TEACHER_MENU.length)
            case command
            when "QUIT"
                running = false
            when "List All Students"
                if Student.all.count > 0
                    Student.display_student_list_sorted(Student.all)
                else
                    puts "  There are not students."
                end
            when "List All Courses"
                if Course.all.count > 0
                    Course.display_course_list_sorted(Course.all)
                else
                    puts "  There are no courses."
                end
            when "Add a Student"
                result = prompt.collect do
                    key(:first_name).ask("Student's first name?")
                    key(:last_name).ask("Student's last name?")
                end
                Student.create(first_name: result[:first_name], last_name: result[:last_name])
            when "Add a Course"
                teachers = Student.students_with_ids(Teacher.all)
                result = prompt.collect do
                    key(:name).ask("What is the course name?")
                    key(:teacher_id).select("Who is teaching the course?", teachers, per_page: teachers.length)
                    key(:date_time).ask("What day and time is the course?", convert: :datetime)
                end
                Course.create(name: result[:name], teacher_id: result[:teacher_id], date_time: result[:date_time])
            when "Create a Course Assignment"
                courses = Course.courses_with_ids(Course.all)
                selected_course_id = prompt.select("Which course?", courses, per_page: courses.length)
                students = Student.students_with_ids(Student.all)
                selected_students_ids = prompt.multi_select("Which students?", students, per_page: students.length)

                selected_students_ids.each do |student_id|
                    course_assignment = StudentCourse.create(student_id: student_id, course_id: selected_course_id, status: "Incomplete")
                end
            when "Delete a Course Assignment"
                
            when "Mark Attendance"
                student_courses = StudentCourse.student_courses_with_ids(StudentCourse.all)
                selected_student_course_id = prompt.select("Which assignment?", student_courses, per_page: student_courses.length)
                selected_student_course_record = StudentCourse.find(selected_student_course_id)
                selected_student_course_record.update(status: "Complete")
            when "List My Courses"
                my_courses = Course.where(teacher_id: user_data[:user_id])
                if my_courses.count > 0
                    Course.display_course_list_sorted(my_courses)
                else
                    puts "  You don't have any course."
                end
            when "List All Course Assignments"
                if StudentCourse.all.count > 0
                    StudentCourse.display_student_course_list_sorted(StudentCourse.all)
                else
                    puts "  There are no course assigments."
                end
            when "List Missed Course Assignment"
                incomplete_course_assignments = StudentCourse.all.where(status: "Incomplete")
                missed_course_assignments = incomplete_course_assignments.select {|incomplete_course_assignment| incomplete_course_assignment.course.date_time < Time.now.to_datetime}
                if missed_course_assignments.count > 0
                    StudentCourse.display_student_course_list_sorted(missed_course_assignments)
                else
                    puts "  There are no missed course assignments."
                end
            else
                puts "Command \'#{command}\' not recognized."
            end
        else
            puts "User not recognized."
        end
    else
        command = prompt.select("What kind of user are you", USER_TYPES, per_page: USER_TYPES.length)

        case command
        when USER_TYPES[0]
            students = Student.students_with_ids(Student.all)
            if(students.count > 0)
                user_id = prompt.select("Which student are you?", students, per_page: students.length)
                user_data[:user_id] = user_id
                user_data[:selected] = true
                user_data[:user_type] = command
            else
                puts "There are no student to select from."
            end
        when USER_TYPES[1]
            teachers = Student.students_with_ids(Teacher.all)
            if(teachers.count > 0)
                user_id = prompt.select("Which teacher are you?", teachers, per_page: teachers.length)
                user_data[:user_id] = user_id
                user_data[:selected] = true
                user_data[:user_type] = command
            else
                puts "There are no teachers to select from."
            end
        else
            puts "User \'#{command}\' not recognized."
        end  
    end
end