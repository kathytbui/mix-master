require "rails_helper"

RSpec.describe "Create a song feature" do
  before :each do
    @blink = Artist.create(name: "Blink 182", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  end

  it "can create a new song belonging to an artist from artist songs index" do
    title = "I miss you"
    visit "/artists/#{@blink.id}"
    expect(page).to_not have_content(title)
    click_on "New song"
    expect(current_path).to eq("/artists/#{@blink.id}/songs/new")
    fill_in :title, with: title
    click_on "Create Song"
    expect(current_path).to eq("/songs/#{@blink.songs.last.id}")
    expect(page).to have_link(@blink.name)
    click_on @blink.name
    expect(current_path).to eq("/artists/#{@blink.id}")
  end

  it "cannot create a new song if information is missing" do
    title = "I miss you"
    visit "/artists/#{@blink.id}"
    expect(page).to_not have_content(title)
    click_on "New song"
    expect(current_path).to eq("/artists/#{@blink.id}/songs/new")
    fill_in :title, with: ""
    click_on "Create Song"
    expect(current_path).to eq("/artists/#{@blink.id}/songs/new")
    expect(page).to_not have_link(@blink.name)
    expect(page).to have_content("Title cannot be blank")
  end
end
