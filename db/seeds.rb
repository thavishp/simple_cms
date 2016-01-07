# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
AdminUser.create(first_name: 'Thavish', last_name: 'Perera', username: 'tperera11')

# Subjects
Subject.create(name: 'Initial Subject', position: 1, visible: true)
Subject.create(name: 'Revised Subject', position: 2, visible: true)
Subject.create(name: 'Third Subject', position: 3, visible: false)

# Pages
Page.create(name: 'First Page', permalink: 'first', position: 1, visible: true)
Page.create(name: 'Test Page', permalink: 'test', position: 2, visible: false)

# Sections
Section.create(name: 'First Section', position: 1, visible: false)