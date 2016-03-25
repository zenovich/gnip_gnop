module GnipGnop
  class ActivityObject
    include HappyMapper

    tag 'object'

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    element :id, String, :namespace => :default
    element :content, String, :attributes => { :type => String }, :namespace => :default
    has_one :link, Link
  end
end
