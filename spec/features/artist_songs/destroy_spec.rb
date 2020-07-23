require "rails_helper"

RSpec.describe "" do
	before :each do
    @blink = Artist.create(name: "Blink 182", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
		@song_1 = @blink.songs.create(title: "I miss you")
		@song_2 = @blink.songs.create(title: "No one likes you when you're 23")
		@song_3 = @blink.songs.create(title: "Bored to death")
		@song_4 = @blink.songs.create(title: "She's out of her mind")
	end

  it "can delete an artist and return me back to the previous page I was on" do
    
    visit "/artists/#{@bob.id}/songs"
    click_on "Delete"

  end
end
