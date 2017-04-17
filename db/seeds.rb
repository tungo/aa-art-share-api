# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
u1 = User.create(username: 'Monte')
u2 = User.create(username: 'Tu')
u3 = User.create(username: 'Picasso')
u4 = User.create(username: 'Monet')

Artwork.delete_all
a1 = Artwork.create(title: 'The Weeping Woman', image_url: 'some_url.aa', artist_id: u3.id)
a2 = Artwork.create(title: 'The Old Guitarist', image_url: 'some_other_url.aa', artist_id: u3.id)
a3 = Artwork.create(title: 'Poppies', image_url: 'some_url.aa', artist_id: u4.id)
a4 = Artwork.create(title: 'Water Lily Pond', image_url: 'some_other_url.aa', artist_id: u4.id)

ArtworkShare.delete_all
ArtworkShare.create(artwork_id: a1.id, viewer_id: u1.id)
ArtworkShare.create(artwork_id: a2.id, viewer_id: u1.id)
ArtworkShare.create(artwork_id: a3.id, viewer_id: u2.id)
ArtworkShare.create(artwork_id: a4.id, viewer_id: u2.id)
ArtworkShare.create(artwork_id: a1.id, viewer_id: u2.id)
ArtworkShare.create(artwork_id: a2.id, viewer_id: u2.id)
