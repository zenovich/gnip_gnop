module GnipGnop
  class ActivityActor
    include HappyMapper

    tag 'actor'

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    has_many :links, Link
    element :id, String, :namespace => :default
  end
end
