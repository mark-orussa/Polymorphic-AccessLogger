unless User.all.any?
  User.create(name: 'Test User 1')
  User.create(name: 'Test User 2')
end
