require 'avro_turf'

store = AvroTurf::SchemaStore.new(path: 'my/schemas')
store.load_schemas!

# Accessing 'person' is correct and works fine.
person = store.find('person', 'contacts') # my/schemas/contacts/person.avsc exists

# Trying to access 'address' raises AvroTurf::SchemaNotFoundError
# address = store.find('address', 'contacts') # my/schemas/contacts/address.avsc is not found

puts "===="*10
puts person
puts "===="*10