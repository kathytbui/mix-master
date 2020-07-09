require "rails_helper"

RSpec.describe "Song Show page" do
	before :each do
    @blink = Artist.create(name: "Blink 182", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
		@song = @blink.songs.create(title: "I miss you")
	end

	it "can update a song and see a link to the song artist's show page" do
		visit "/songs/#{@song.id}"
		click_on "Edit #{@song.title}"
		expect(current_path).to eq("/songs/#{@song.id}/edit")
	end
end
