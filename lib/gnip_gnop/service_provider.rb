module GnipGnop
  class ServiceProvider
    include HappyMapper

    tag 'provider'
    namespace "service"

    element :name, String, :namespace => :default
    element :uri, String, :namespace => :default
    element :icon, String, :namespace => :default
  end
end
