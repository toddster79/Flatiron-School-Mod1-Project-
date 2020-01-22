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
    "QUIT",
    "List Required Course",
    "List Missed Courses",
    "List Completed Course",
    "List Classmates"
]

TEACHER_MENU = [
    "QUIT",
    "List All Students",
    "List All Courses",
    "Add a Student",
    "Add a Course",
    "Create a Course Assignment",
    "Mark Attendance",
    "List my Courses",
    "List Truents"
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
                puts "Create a Course Assignment"
            when "Mark Attendance"
                puts "Mark Attendance"
            when "List my Courses"
                puts "List my Courses"
            when "List Truents"
                puts "List Truents"
            else
                puts "Command \'#{command}\' not recognized."
            end
        else
            puts "User not recognized."
        end
    else
        command = prompt.select("What kind of user are you", user_types)

        case command
        when "Student"
            user_selected = true
            user_type = :student
        when "Teacher"
            user_selected = true
            user_type = :teacher
            user_teacher_name = prompt.ask("What is your name?")
        else
            puts "User \'#{command}\' not recognized."
        end  
    end
end