module GnipGnop
  class Entry
    include HappyMapper
    include FieldHelpers

    tag 'entry'

    register_namespace(DEFAULT_NS, "http://www.w3.org/2005/Atom")
    register_namespace("activity", "http://activitystrea.ms/spec/1.0/")
    register_namespace("service", "http://activitystrea.ms/service-provider")
    register_namespace("gnip", "http://www.gnip.com/schemas/2010")

    element :id, String
    element :published, DateTime, :on_save => :format_date_time
    element :updated, DateTime, :on_save => :format_date_time
    element :title, String
    has_one :summary, Summary
    has_many :categories, Category
    has_one :link, Link
    has_one :source, Source
    has_one :service_provider, ServiceProvider, :namespace => 'service'
    element :activity_verb, String, :tag => 'verb', :namespace => 'activity'
    has_one :activity_object, ActivityObject
    has_one :author, Author
    has_one :activity_author, ActivityAuthor
    has_one :activity_actor, ActivityActor
    has_one :matching_rules, MatchingRules, :namespace => "gnip"
  end
end
