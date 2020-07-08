require "rails_helper"

RSpec.describe "When I visit an Artist's index" do
	before :each do
		@bob = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
		@britney = Artist.create(name: "Brittney Spears", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
	end
	it "I should see each artist's name with a link to each artists's show page" do
		visit "/artists"
		expect(page).to have_content(@bob.name)
		expect(page).to have_css("img[src=\"#{@bob.image_path}\"]")
		expect(page).to  have_link("#{@bob.name}", count: 1, exact: true)
		expect(page).to have_content(@britney.name)
		expect(page).to have_css("img[src=\"#{@britney.image_path}\"]")
		expect(page).to  have_link("#{@britney.name}", count: 1, exact: true)
	end
end
