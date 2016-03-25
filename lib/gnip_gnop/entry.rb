module GnipGnop
  class Entry
    include HappyMapper

    tag 'entry'

    register_namespace(:default, "http://www.w3.org/2005/Atom")
    register_namespace("activity", "http://activitystrea.ms/spec/1.0/")
    register_namespace("service", "http://activitystrea.ms/service-provider")
    register_namespace("gnip", "http://www.gnip.com/schemas/2010")

    element :id, String
    element :published, DateTime
    element :updated, DateTime
    element :title, String
    element :summary, String, :attributes => { :type => String }
    has_many :categories, Category
    has_one :link, Link
    has_one :source, Source
    has_one :service_provider, ServiceProvider, :namespace => 'service'
    element :activity_verb, String, :tag => 'verb', :namespace => 'activity'
    has_one :activity_object, ActivityObject
    has_one :author, Author
    has_one :activity_author, ActivityAuthor
    has_one :activity_actor, ActivityActor
    has_many :matching_rules, MatchingRule, :xpath => "./gnip:matching_rules/"
  end
end
