class TeacherDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_title
    sprintf("%s [%s]", full_name, academic_title)
  end
end
