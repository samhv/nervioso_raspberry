require_relative './src/Songs/GameSong.rb'

#Archivos canciones
Dir["./src/Songs/*.rb"].each do |file|
	require_relative(file)
end

#Archivos base
Dir["./src/BasePatterns/*.rb"].each do |file|
	require_relative(file)
end

#Todo lo demas
Dir["./src/*.rb"].each do |file|
	require_relative(file)
end
