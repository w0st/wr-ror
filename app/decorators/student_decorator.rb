class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item_notes.select do |note|
      note.subject_item == subject_item
    end
    if notes.size > 0
      sprintf("%.2f", notes.inject(0.0) { |sum, e| sum + e.value} / notes.size)
    else
      "0.00"
    end
  end

  def birthdate_format
    birthdate.nil? ? "" : birthdate.strftime("%Y-%m_%d")
  end
end
