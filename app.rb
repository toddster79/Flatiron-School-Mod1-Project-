require_relative "config/environment"
prompt = TTY::Prompt.new

puts "Welcome to the Course Machine."

running = true

user_selected = false
user_types = ["Student", "Teacher"]
user_type = nil
user_student = nil
user_teacher_name = nil

STUDENT_MENU = [
    "List Required Course",
    "List Missed Courses",
    "List Completed Course",
    "List Classmates",
    "QUIT"
]

TEACHER_MENU = [
    "List All Students",
    "List All Courses",
    "Add a Student",
    "Add a Course",
    "Create a Course Assignment",
    "Mark Attendance",
    "List my Courses",
    "List Truents",
    "QUIT"
]

COURSE_ASSIGNMENT_STATES = [
    "Incomplete",
    "Complete",
]

while running
    if user_selected
        case user_type
        when :student
            command = prompt.select("What would you like to do?", STUDENT_MENU, per_page: STUDENT_MENU.length)
            case command
            when "QUIT"
                running = false
            when "List Required Course"
                puts "List Required Course"
            when "List Missed Courses"
                puts "List Missed Courses"
            when "List Completed Course"
                puts "List Completed Course"
            when "List Classmates"
                puts "List Classmates"
            else
                puts "Command \'#{command}\' not recognized."
            end
        when :teacher
            command = prompt.select("What would you like to do #{user_teacher_name}?", TEACHER_MENU, per_page: TEACHER_MENU.length)
            case command
            when "QUIT"
                running = false
            when "List All Students"
                Student.display_student_list_sorted(Student.all)
            when "List All Courses"
                Course.display_course_list_sorted(Course.all)
            when "Add a Student"
                result = prompt.collect do
                    key(:first_name).ask("Student's first name?")
                    key(:last_name).ask("Student's last name?")
                end
                Student.create(first_name: result[:first_name], last_name: result[:last_name])
            when "Add a Course"
                result = prompt.collect do
                    key(:name).ask("What is the course name?")
                    key(:teacher_name).ask("Who is teaching the class?")
                    key(:date_time).ask("What day and time is the course?")
                end
                Course.create(name: result[:name], teacher_name: result[:teacher_name], date_time: result[:date_time])
            when "Create a Course Assignment"
                courses = Course.courses_with_ids(Course.all)
                selected_course_id = prompt.select("Which course?", courses, per_page: courses.length)
                students = Student.students_with_ids(Student.all)
                selected_students_ids = prompt.multi_select("Which students?", students, per_page: students.length)

                selected_students_ids.each do |student_id|
                    course_assignment = Student_course.create(student_id: student_id, course_id: selected_course_id, status: "Incomplete")
                end
            when "Mark Attendance"
                student_courses = Student_course.student_courses_with_ids(Student_course.all)
                selected_student_course_id = prompt.select("Which assignment?", student_courses, per_page: student_courses.length)
                selected_student_course_record = Student_course.find(selected_student_course_id)
                selected_student_course_record.update(status: "Complete")
            when "List my Courses"
                Course.display_course_list_sorted(Course.where(teacher_name: user_teacher_name))
            when "List Truents"
                puts "List Truents"
            else
                puts "Command \'#{command}\' not recognized."
            end
        else
            puts "User not recognized."
        end
    else
        command = prompt.select("What kind of user are you", user_types, per_page: user_types.length)

        case command
        when "Student"
            user_selected = true
            user_type = :student
            students = Student.students_with_ids(Student.all)
            user_student = prompt.select("Which students?", students, per_page: students.length)
        when "Teacher"
            user_selected = true
            user_type = :teacher
            user_teacher_name = prompt.ask("What is your name?")
        else
            puts "User \'#{command}\' not recognized."
        end  
    end
end