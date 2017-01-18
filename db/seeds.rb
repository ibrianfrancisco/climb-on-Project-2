# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@users = User.create ([
  {name: "Brian", age: 27, bio: "Created this app for rock climbing", location: "California", email: "bfran@yahoo.com", password: "abc123", password_confirmation: "abc123"},
  {name: "Carlos", age: 17, bio: "I enjoy walks in the park.", location: "Ohio", email: "carlos@yahoo.com", password: "abc123", password_confirmation: "abc123"},
  {name: "Rick", age: 63, bio: "I travel to a lot to different dimensions", location: "Arizona", email: "Rick123@yahoo.com", password: "123abc", password_confirmation: "123abc"}
])

@users.first.posts.create ([
  {title: "Apples", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident fuga quas, numquam quisquam impedit odit consequuntur in possimus, tenetur, vero obcaecati quaerat facilis commodi, minus earum aliquid. Inventore impedit, eius.", keyword: "gravity"},
  {title: "Pool table", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus excepturi doloremque voluptatum inventore beatae labore reiciendis, odio neque perferendis id dicta, dolore nam a eveniet ex magnam quos voluptatem temporibus!", keyword: "Kinetic"}
])

@users[1].posts.create ([
  {title: "Space Ships", description: "I am carlos and I am creating a post.", keyword: "carlos"},
  {title: "Science", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis, eaque, quo. Quod id labore minima repellat, assumenda numquam ut officia earum deleniti nobis. Ipsam magnam, eius doloremque ullam quibusdam a!", keyword: "land"}
])

@users[2].posts.create ([
  {title: "Morty", description: "Angry that he was framed, Rick escapes the Council with Morty to go after the real culprit who set him up and finds that another Rick is supposedly responsible for murdering their counterparts while stealing their Morties to conceal his presence.", keyword: "Morty"}
])

# @users[0].posts[0].comments.create([
#   {body: "Two apples fell at the same speed."},
#   {body: "3 apples fell at the same speed."},
#   {body: "One Hunnid apples fell at the same speed."},
#   {body: "No apples fell at the same speed."}
# ])

# @users[1].posts[0].comments.create([
#   {body: "Two alieans fell at the same speed."},
#   {body: "3 space ships fell at the same speed."}
# ])

# @users[1].posts[1].comments.create([
#   {body: "Two fishes fell at the same speed."},
#   {body: "3 Sea animals fell at the same speed."}
# ])

# @users[2].posts[0].comments.create([
#   {body: "Went to a different galaxy and fell at the same speed"},
#   {body: "I was framed and i escaped the Council and then Flib Blob attacked and we escaped with Morty but he weighs a lot."},
#   {body: "Angry that he was framed, Rick escapes the Council with Morty to go after the real culprit who set him up and finds that.."}
# ])
