class Button

	include Runnable
	include Observable
	include PiPiper

	attr_reader :pin_event 

	def initialize pin_event
		super()
		@pin_event = pin_event
		#puts "button #{@pin_event} initialized"
	end

	def run
		@event = PiPiper::Pin.new :pin => @pin_event, :direction => :in
		loop do
			@event.wait_for_change
			#puts "pressed button: #{@pin_event}"
			notify_observers
			sleep 2
		end
		PiPiper.wait # creo que esta linea de codigo hay que sacarla. 10-mayo-2015
	end

	def notify_observers
		for observer in @observers
			observer.notify self
		end
	end
end
