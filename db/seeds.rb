# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

blink = Artist.create(name: "Blink 182", image_path: "https://www.tibs.org.tw/images/default.jpg")
phoenix = Artist.create(name: "Phoenix", image_path: "https://www.tibs.org.tw/images/default.jpg")
song_1 = blink.songs.create(title: "I miss you")
song_2 = blink.songs.create(title: "No one likes you when you're 23")
song_3 = blink.songs.create(title: "Bored to death")
song_4 = blink.songs.create(title: "Liztomania")
song_5 = phoenix.songs.create(title: "Liztomania")
song_6 = phoenix.songs.create(title: "1901")
