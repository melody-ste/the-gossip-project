puts "Nettoyage de la base de données..."

JoinTableRecipientPm.destroy_all
PrivateMessage.destroy_all
GossipTag.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

#Villes
puts "Création des villes..."
10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

password = Faker::Internet.password(min_length: 6)
puts "Création de l'utilisateur avec mot de passe : #{password}"


#Users
puts "Création des utilisateurs..."
users = 10.times.map do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(18..75),
    city: City.all.sample,
    password: password
  )
end

#Gossip
puts "Création des potins..."
20.times do
  Gossip.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user: User.all.sample
  )
end

#tags
puts "Création des tags..."
10.times do
  Tag.create(title: "#" + Faker::Hobby.activity.parameterize)
end

#attribution de tag a chaque gossip
puts "attribution des tag aux potins..."
Gossip.all.each do |gossip|
  tag_sample = Tag.all.sample(rand(1..5)) 
  gossip.tags << tag_sample
end


#commentaires
puts "Creating 20 comments..."

20.times do
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end


#PM
puts "Création des messages privés..."
3.times do
  sender = User.all.sample
  recipients = User.where.not(id: sender.id).sample(rand(1..3))
  pm = PrivateMessage.create(
    content: Faker::Lorem.paragraph(sentence_count: 2),
    sender: sender
  )
  recipients.each do |recipient|
    JoinTableRecipientPm.create(private_message: pm, recipient: recipient)
  end
end

User.create!(
  first_name: "Anonyme",
  last_name: "Inconnu",
  description: "Utilisateur par défaut pour les commentaires anonymes",
  email: "anonyme@example.com",
  age: 99,
  city: City.all.sample,
  password: "mdpanonyme"
)

gossips = Gossip.all
comments = Comment.all

20.times do
  likeable = [gossips.sample, comments.sample].sample
  user = users.sample
  Like.create(likeable: likeable)
end
puts "création des likes..."