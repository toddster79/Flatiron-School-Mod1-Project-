class Student_course < ActiveRecord::Base
    belongs_to :student
    belongs_to :course

    def self.get_student_course(course, student)
        
    end
end