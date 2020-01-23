class CreateCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references :teacher
      t.string :name
      t.string :date_time
    end
  end
end
