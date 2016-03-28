module GnipGnop
  class ActivityObject
    include HappyMapper

    tag 'object'

    namespace "activity"

    element :object_type, String, :tag => 'object-type'
    element :id, String, :namespace => DEFAULT_NS
    element :content, ActivityObject::Content, :namespace => DEFAULT_NS
    has_many :links, Link, :tag => 'link', :namespace => DEFAULT_NS
    has_many :categories, Category, :tag => 'category', :namespace => DEFAULT_NS
    has_one :gnip_statistics, GnipStatistics, :tag => 'statistics', :namespace => 'gnip'
    element :georss_point, String, :tag => 'point', :namespace => 'georss'
  end
end
