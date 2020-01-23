class Teacher < ActiveRecord::Base
    has_many :courses
    has_many :student_courses, through: :courses

    require_relative "../../config/environment"
    
    def self.display_text_headers
        ["Last Name", "First Name"]
    end

    def display_text
        ["#{self.last_name}", "#{self.first_name}"]
    end
 
    def self.teachers_with_ids(teachers)
        teachers_hash= {}

        teachers.each do |teacher|
            teachers_hash[teacher.display_text] = teacher.id
        end

        teachers_hash
    end
    
    def self.display_student_list_sorted (teachers)
        teachers_text = teachers.map {|teacher| teacher.display_text}
        teachers_text = teachers_text.sort
        display_table = TTY::Table.new teacher.display_text_headers, teachers_text

        puts display_table.render(:ascii, padding: [0,1])
    end
end