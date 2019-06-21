require 'rails_helper'

RSpec.feature 'Uploads', type: :feature do
  let(:invalid_phone) { '+121' }
  let(:invalid_email) { 'invalidemail.com' }
  let(:valid_email) { 'valid@email.com' }

  before(:each) do
    visit(root_path)

    attach_file('Choose your CSV file', Rails.root.join('spec', 'fixtures', 'files', 'test.csv'))
    click_on('Submit')
  end

  it 'Invalid phone test', js: true do

    # Id should be nil
    expect(find('tbody > tr:first-child > td:nth-child(2)')).to have_content(nil)

    # phone column should be editable
    expect(page).to have_selector("tbody > tr:first-child > td:nth-child(6) > input[value='#{invalid_phone}']")

    # Invalid phone error should be displayed
    expect(find('tbody > tr:first-child > td:nth-child(7)')).to have_content('Phone is invalid')

    # Change into valid phone number and save
    find(:css, 'tbody > tr:first-child > td:nth-child(6) > input').set(invalid_phone + '89')
    find('tbody > tr:first-child > td:nth-child(8) > button').click

    # Id should be same with person's id and displayed ID column on table and be disable save button
    expect(find('tbody > tr:first-child > td:nth-child(1)')).to have_content(Person.last.id.to_s)
    expect(find('tbody > tr:first-child > td:nth-child(7)')).to have_button('Save', disabled: true)
  end

  it 'invalid email test', js: true do

    # Id should be nil
    expect(find('tbody > tr:nth-child(3) > td:nth-child(2)')).to have_content(nil)

    # Email column should be editable
    expect(page).to have_selector("tbody > tr:nth-child(3) > td:nth-child(5) > input[value='#{invalid_email}']")

    # Invalid email error should be displayed
    expect(find('tbody > tr:nth-child(3) > td:nth-child(7)')).to have_content('Email is invalid')

    # Change into valid email and save
    find(:css, 'tbody > tr:nth-child(3) > td:nth-child(5) > input').set(valid_email)
    find('tbody > tr:nth-child(3) > td:nth-child(8) > button').click

    # Id should be same with person's id and displayed ID column on table and be disable save button
    expect(find('tbody > tr:nth-child(3)> td:nth-child(1)')).to have_content(Person.last.id.to_s)
    expect(find('tbody > tr:nth-child(3) > td:nth-child(7)')).to have_button('Save', disabled: true)
  end
end
