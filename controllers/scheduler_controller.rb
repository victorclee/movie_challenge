require_relative '../config/ruby_manifest.rb'

class SchedulerController
  attr_reader :load_view, :runner_view, :movie_loader, :today
  attr_accessor :finished

  def initialize
    @load_view = LoadView.new
    @runner_view = RunnerView.new
    @movie_loader = MovieLoader.new
    @today = Time.now
    @finished = false
  end

  def run_program #This is the flow of your program, call other classes and methods to complete
    runner_view.reset_screen!
    load_view.ask_to_reload(today)
    reload_input = gets.chomp

    if reload_input == 'yes'
      movie = MovieLoader.new
      file = File.read('movie_list.json')
      movie_info = JSON.parse(file)
      movie_info.each do |mov|
        p mov["title"]
        p mov["time"].split(" ").delete "min", "hr"
        # puts mov["rating"]
      end
      movie_loader.compile_todays_list
      load_view.finished
    end

    until finished
      # logic for your program

      runner_view.ask_if_user_is_finished
      user_choice = gets.chomp

      if user_choice == 'DCI 2017 Tour Premiere'
      
      elsif user_choice == 'all'

      elsif user_choice == 'end'
        exit_program 



      end
    end    
  
      # runner_view.input_movie_title
      # user_pick = gets.chomp

      #     p mov["time"]
      #     p mov["rating"]

  end

  def exit_program
    self.finished = true
    runner_view.good_bye_message
  end
end
