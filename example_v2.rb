require 'avro_turf'

# Schemas will be looked up from the specified directory.
avro = AvroTurf.new(schemas_path: 'my/schemas')

person_data = {
  "name" => "Jane",
  "age" => 28,
  "address" => {
    "addr1" => "123 Main St",
    "addr2" => "Apt 4B",
    "city" => "New York",
    "zip" => "10001"
  }
}

# Use the namespaced schema name "contacts.person" instead of just "person"
encoded_data = avro.encode(person_data, schema_name: "contacts.person")

# Decode some data using the namespaced schema name
decoded_data = avro.decode(encoded_data, schema_name: "contacts.person")

puts decoded_data

# Data can be validated before encoding to get a description of problem through
# Avro::SchemaValidator::ValidationError exception
# avro.encode({ "titl" => "hello, world" }, schema_name: "person", validate: true)

# If you do not want to register the schema in case it does not exist, you can pass the register_schemas option as false
avro.encode({ "titl" => "hello, world" }, schema_name: "contacts.person", validate: true)


# "address" => {"addr1" => "123 Main St", "addr2" => "Apt 4B", "city" => "New York", "zip" => "10001"}}
# /home/matias/.asdf/installs/ruby/3.4.4/lib/ruby/gems/3.4.0/gems/avro-1.12.0/lib/avro/schema_validator.rb:81:in 'Avro::SchemaValidator.validate!': at .address expected type record, got null (Avro::SchemaValidator::ValidationError)
# at . extra field 'titl' - not in schema