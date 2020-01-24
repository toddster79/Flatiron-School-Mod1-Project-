class Course < ActiveRecord::Base
    has_many :student_courses
    has_many :students, through: :student_courses
    belongs_to :teacher

    require_relative "../../config/environment"

    def self.display_text_headers
        ["Name", "Teacher Name", "Date/Time"]
    end

    def display_text
        parsed_date_time = DateTime.parse(self.date_time).strftime("%m-%d-%y %H:%M")
        ["#{self.name}", "#{self.teacher.display_text}", "#{parsed_date_time}"]
    end

    def self.courses_with_ids(courses)
        courses_hash= {}

        courses.each do |course|
            courses_hash[course.display_text] = course.id
        end

        courses_hash
    end

    def self.display_course_list_sorted (courses)
        courses_text = courses.map {|course| course.display_text}
        courses_text = courses_text.sort
        display_table = TTY::Table.new Course.display_text_headers, courses_text
        
        puts display_table.render(:ascii, padding: [0,1])
    end
end