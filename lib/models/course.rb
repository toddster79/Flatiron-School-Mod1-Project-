class Course < ActiveRecord::Base
    has_many :student_courses
    has_many :students, through: :student_courses

    def mark_attendance(course, students)
        students.each do |student|
            course_assignment = Student_course.get_student_course(course, student)
            if course_assignment
                course_assignment.status = "Complete"
            else
                puts "Could not mark attendance for #{student.first_name} #{student.last_name} for #{course.name}"
                #throw error?
            end
        end
    end

    def self.teacher_courses(teacher_name)
        Course.all.select {|course| course.teacher_name == teacher_name}
    end

    def self.display_course_list_sorted (courses)
        courses_text = courses.map {|course| "#{course.name} #{course.teacher_name} #{course.date_time}"}
        courses_text = courses_text.sort
        courses_text.each do |course_text|
            puts "#{course_text}"
        end
    end
end