# ./lib/controller.rb
class Controller
  attr_reader :name, :action
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action: nil)
    @name = name
    @action = action # 1
  end

  def call
    send(action) # 2
    self.status = 200 # 3
    self.headers = {'Content-Type' => 'text/html'}
    self.content = [template.render(self)]
    self
  end

  def template
    Slim::Template.new(File.join(App.root, 'app', 'views', "#{self.name}", "#{self.action}.slim"))
  end

  def not_found # 4
    self.status = 404
    self.headers = {}
    self.content = ['Terribly sorry - nothing\'s here']
    self
  end

  def internal_error
    self.status = 500
    self.headers = {}
    self.content = ['Crash! Internal error']
    self
  end
end
