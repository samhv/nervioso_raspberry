#Archivos base
Dir["./src/BasePatterns/*.rb"].each { |file| require_relative file }

#Todo lo demas
Dir["./src/*.rb"].each { |file| require_relative file }
