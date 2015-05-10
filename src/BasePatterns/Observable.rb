=begin
patterns:	observer
objetivo:	gatillar eventos notificando a objetos observadores/registrados (Observer.rb)  
=end
module Observable

	def initialize
		@observers = []
    end
	
	def register_observer observer 
		@observers.push observer
	end

	def unregister_observer observer
		@observers.delete observer
	end  

	def notify_observers
		raise "module Observer, method notify_observers, override me pls"
	end

end
