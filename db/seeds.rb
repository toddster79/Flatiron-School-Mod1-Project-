Student_course.destroy_all
Student.destroy_all
Course.destroy_all

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

course1 = Course.create(name: "Enumerables",teacher_name: "Damon",date_time: "1/20/20 11:00:00")
course2= Course.create(name: "SQL",teacher_name: "Kyle",date_time: "1/20/20 11:00:00")
course3 = Course.create(name: "Basic App",teacher_name: "Kat",date_time: "1/20/20 11:00:00")
course4 = Course.create(name: "Active Record",teacher_name: "Damon",date_time: "1/20/20 11:00:00")