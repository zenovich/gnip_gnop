module GnipGnop
  class ActivityAuthor
    include HappyMapper

    tag 'author'

    def avatar_image
      avatar_link = links.detect { |l| l.rel == 'avatar' }
      avatar_link ? avatar_link.href : ''
    end

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    has_many :links, Link
    element :id, String, :namespace => :default
  end
end
