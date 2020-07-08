require "rails_helper"

RSpec.describe "When I visit the Artist show page" do
	before :each do
    @bob = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
	end

  it "should show information about one specific artist" do
    visit "/artists/#{@bob.id}"
    expect(page).to have_content(@bob.name)
    expect(page).to have_css("img[src=\"#{@bob.image_path}\"]")
	end

	it "should show and edit link to update artist info" do
		visit "/artists/#{@bob.id}"

		click_on "Edit"
		expect(current_path).to eq("/artists/#{@bob.id}/edit")

		fill_in :name, with: "BM"

		click_on "Update Artist"
		expect(current_path).to eq("/artists/#{@bob.id}")
		expect(page).to have_content("BM")
		expect(page).to have_css("img[src=\"#{@bob.image_path}\"]")
		expect(page).to_not have_content(@bob.name)
	end
end
