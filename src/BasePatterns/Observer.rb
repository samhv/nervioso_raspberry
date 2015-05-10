=begin
patterns:	observer
objetivo:	poder actuar en base a eventos gatillados por objetos observables (Observable.rb) 
=end
module Observer

	def notify observable, data = nil
		raise "module Observer, method notify, override me pls"
	end
	
end