require 'rails_helper'

feature "Events" do

  scenario "User creates a new event" do
    Event.create!(
    description: "Awesome Paw Event"
    )

    visit root_path
    click_on "New Event"
    fill_in "Capacity", with: "100"
    click_on "Create Event"

    expect(page).to have_content("100")
  end

  scenario "User shows an event" do
    Event.create!(
    description: "Awesome Paw Event"
    )

    visit root_path
    expect(page).to have_content("Awesome Paw Event")
    click_on "Awesome Paw Event"

    expect(page).to have_content("Awesome Paw Event")
  end

  scenario "User edits an event" do
    Event.create!(
      description: "Awesome Paw Event",
    )

    visit root_path
    click_on "edit"
    fill_in "Location", with: "SFSPCA"
    click_on "Update Event"

    expect(page).to have_content("SFSPCA")
  end

  scenario "User deletes an event" do
    Event.create!(
    description: "Awesome Paw Event"
    )

    visit root_path
    expect(page).to have_content("Awesome Paw Event")
    click_on "delete"

    expect(page).to have_no_content("Awesome Paw Event")
  end


end
