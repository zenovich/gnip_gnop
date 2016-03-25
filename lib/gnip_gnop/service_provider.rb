module GnipGnop
  class ServiceProvider
    include HappyMapper

    tag 'provider'
    namespace "service"

    element :name, String, :namespace => DEFAULT_NS
    element :uri, String, :namespace => DEFAULT_NS
    element :icon, String, :namespace => DEFAULT_NS
  end
end
