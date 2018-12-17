# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed profiles
ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO profiles (profile) VALUES ('SuperAdministrador'), ('Administrador'), ('Ventas')
SQL

# Seed document types
ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO document_types (document) VALUES ('Cédula'), ('Pasaporte'), ('Cédula Extranjera'), ('Registro Civil'), ('Contraseña')
SQL