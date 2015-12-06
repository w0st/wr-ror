puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
SUBJECT_TITLES = %w(Mathematics Software\ Engineering Statistics Philosophy Management)
DATE_FROM = Date.parse('01-01-1980')
DATE_TO = Date.parse('31-12-1999')
User.create!(email: 'admin@admin.com',password: 'adminadmin')


3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: SUBJECT_TITLES.pop,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: rand(0..3) == 0 ? rand(DATE_FROM .. DATE_TO): nil
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
