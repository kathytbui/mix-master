require "rails_helper"

RSpec.describe "When I visit the create a new artist page" do
	describe "I can submit data on a form to create new artist" do
	before :each do
    @artist_name = "Bob Marley"
    @artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
	end

	it "with valid information in all fields and see my new artist created" do
    visit "/artists"
    expect(page).to_not have_content(@artist_name)

    click_on "New Artist"
    expect(current_path).to eq("/artists/new")

    fill_in :name, with: @artist_name
    fill_in :image_path, with: @artist_image_path

    click_on "Create Artist"
    expect(current_path).to eq("/artists")

    expect(page).to have_content(@artist_name)
    expect(page).to have_css("img[src=\"#{@artist_image_path}\"]")
	end

	it "without all valid information in all fields and see an error" do

		visit "/artists"
    expect(page).to_not have_content(@artist_name)

    click_on "New Artist"
    expect(current_path).to eq("/artists/new")

    fill_in :image_path, with: @artist_image_path

    click_on "Create Artist"
    expect(current_path).to eq("/artists/new")

    expect(page).to have_content("Artist not created: Required information is missing")
		end
  end
end
