class StudentCourse < ActiveRecord::Base
    belongs_to :student
    belongs_to :course

    require_relative "../../config/environment"

    def self.display_text_headers
        ["Student", "Course", "Status"]
    end

    def display_text
        ["#{self.student.display_text}", "#{self.course.display_text}", "#{self.status}"]
    end
 
    def self.student_courses_with_ids(student_courses)
        student_courses_hash= {}

        student_courses.each do |student_course|
            student_courses_hash[student_course.display_text] = student_course.id
        end

        student_courses_hash
    end
    
    def self.display_student_course_list_sorted (student_courses)
        student_courses_text = student_courses.map {|student_course| student_course.display_text}
        student_courses_text = student_courses_text.sort
        display_table = TTY::Table.new StudentCourse.display_text_headers, student_courses_text

        puts display_table.render(:ascii, padding: [0,1])       
    end
end