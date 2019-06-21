require 'csv'

class CSVParser
  def self.parse(csv_file)
    people = []
    CSV.parse(csv_file, headers: true) do |person|
      new_person = Person.new(person.to_hash)
      people << new_person
      new_person.save
    end
    people
  end
end
