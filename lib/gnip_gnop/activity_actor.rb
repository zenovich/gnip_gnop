module GnipGnop
  class ActivityActor
    include HappyMapper

    tag 'actor'

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    has_many :links, Link, :namespace => DEFAULT_NS
    element :id, String, :namespace => DEFAULT_NS
  end
end
