require 'rails_helper'

describe CSVParser do
  it 'Should create records from CSV' do
    expect do
      @records = CSVParser.parse(file_fixture('test.csv').read)
    end.to change(Person, :count).by(1)

    expect(@records.size).to eq(2)
  end
end
