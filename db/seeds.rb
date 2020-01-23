StudentCourse.destroy_all
Student.destroy_all
Course.destroy_all
Teacher.destroy_all

student01 = Student.create(first_name:"Todd", last_name: "Carlson")
student02 = Student.create(first_name: "Doug", last_name: "Johnson")
student03 = Student.create(first_name: "Jared", last_name: "Smith")
student04 = Student.create(first_name: "Lilly", last_name: "Smith")
student05 = Student.create(first_name: "Rachel", last_name: "Smith")
student06 = Student.create(first_name: "Bradely", last_name: "Smith")
student07 = Student.create(first_name: "Zig-Zag", last_name: "Smith")
student08 = Student.create(first_name: "Zesty", last_name: "Smith")
student09 = Student.create(first_name: "Adam", last_name: "Smith")
student10 = Student.create(first_name: "Dillon", last_name: "Smith")

teacher1 = Teacher.create(first_name:"Kyle", last_name: "Coberly")
teacher2 = Teacher.create(first_name:"Damon", last_name: "Smith")

course1 = Course.create(name: "Enumerables",date_time: "2020-01-01T02:02:02-07:00",teacher_id: teacher1.id)
course1 = Course.create(name: "Apps",date_time: "2020-01-02T02:02:02-07:00",teacher_id: teacher2.id)