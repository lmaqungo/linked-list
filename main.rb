require_relative 'lib/linked-list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.insert_at('goldfish', 2)

puts list