# app/controllers/main_controller.rb

class MainController < Controller
  def index
    @test = 'Some dump text here'
    @arr = %w(one two three)
  end

  def hello
    @test = 'Dis is de HELLO page!'
    @arr = %w(hello hi greetings hola aloha hey)
  end
end
