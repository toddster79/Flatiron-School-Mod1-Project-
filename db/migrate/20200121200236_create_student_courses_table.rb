class CreateStudentCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.references :student
      t.references :course
      t.string :status
    end
  end
end
