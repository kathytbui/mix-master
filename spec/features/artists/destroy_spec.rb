require "rails_helper"

RSpec.describe "Destroy feature" do
	before :each do
    @bob = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
	end

  it "can destroy an artist fro the artist's show page" do
    visit "/artists/#{@bob.id}"
    click_on "Delete"
    expect(current_path).to eq("/artists")
    expect(page).to_not have_content(@bob.name)
  end
end
