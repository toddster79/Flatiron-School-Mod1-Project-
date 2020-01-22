class Student < ActiveRecord::Base
    has_many :student_courses
    has_many :courses,through: :student_courses

    require_relative "../../config/environment"
    
    def self.display_text_headers
        ["Last Name", "First Name"]
    end

    def display_text
        ["#{self.last_name}", "#{self.first_name}"]
    end
 
    def self.students_with_ids(students)
        students_hash= {}

        students.each do |student|
            students_hash[student.display_text] = student.id
        end

        students_hash
    end
    
    def self.display_student_list_sorted (students)
        students_text = students.map {|student| student.display_text}
        students_text = students_text.sort
        display_table = TTY::Table.new Student.display_text_headers, students_text

        puts display_table.render(:ascii, padding: [0,1])
    end
end