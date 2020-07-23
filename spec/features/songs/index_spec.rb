require "rails_helper"

RSpec.describe "Songs index page" do
	before :each do
		@blink = Artist.create(name: "Blink 182", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
		@song_1 = @blink.songs.create(title: "I miss you")
		@song_2 = @blink.songs.create(title: "No one likes you when you're 23")
		@song_3 = @blink.songs.create(title: "Bored to death")
		@song_4 = @blink.songs.create(title: "She's out of her mind")
	end

	it "should diplay songs in alphabetical order" do
		visit "/artists/#{@blink.id}/songs"
		expect(page).to have_content("#{@song_3.title} #{@song_1.title} #{@song_2.title} #{@song_4.title}")
	end
end
