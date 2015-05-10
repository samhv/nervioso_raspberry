=begin
patterns:	runnable
objetivo:	proveer una rutina ejecutable (run) que puede ser corrida en otro (o el mismo) thread.
=end
module Runnable

	attr_reader :thread_running

	def run_thread
		@thread_running = Thread.new { run }
	end

	def run
		raise "module Runnable, method run_loop, override me pls"
	end

end