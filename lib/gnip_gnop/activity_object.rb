module GnipGnop
  class ActivityObject
    include HappyMapper

    tag 'object'

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    element :id, String, :namespace => DEFAULT_NS
    element :content, ActivityObjectContent, :namespace => DEFAULT_NS
    has_one :link, Link, :namespace => DEFAULT_NS
  end
end
