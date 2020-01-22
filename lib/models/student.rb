class Student < ActiveRecord::Base
    has_many :student_courses
    has_many :courses,through: :student_courses

    def self.display_student_list_sorted (students)
        students_text = students.map {|student| "#{student.last_name}, #{student.first_name}"}
        students_text = students_text.sort
        students_text.each do |student_text|
            puts "#{student_text}"
        end
    end

    def required_courses
        
    end

    def missed_courses
        
    end

    def completed_courses
        
    end

    def classmates(course)
        
    end

    def courses_today
        
    end
end