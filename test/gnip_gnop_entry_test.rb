require 'minitest_helper'

describe GnipGnop::Entry do

  def xml
    @xml ||= File.read(File.expand_path('../fixtures/entry.xml', __FILE__))
  end

  before do
    @entry = GnipGnop::Entry.parse(xml)
  end

  it "should parse a top-level element" do
    @entry.id.must_equal "tag:search.twitter.com,2005:180761363340197888"
  end

  it "should parse the summary's text" do
    @entry.summary.text.must_equal "@redheadphotog Huh. Good luck hon. You know... Two apartments in our building will be vacant soon... D101 and D103..."
  end

  it "should parse the summary's type attribute" do
    @entry.summary.type.must_equal 'html'
  end

  it "should parse the entry's link's href" do
    @entry.link.href.must_equal "http://twitter.com/greeneyedtengu/statuses/180761363340197888"
  end

  it "should parse the entry's source's link's href" do
    @entry.source.link.href.must_equal "http://search.twitter.com/search.atom?q=apartments&rpp=99&result_type=recent&since_id=180761625198993408"
  end

  it "should parse the entry's source's title" do
    @entry.source.title.must_equal "Twitter - Keyword - Notices - apartments"
  end

  it "should parse the entry's source's rule" do
    @entry.source.rule.must_equal "some rule"
  end

  it "should parse the entry's provider" do
    @entry.service_provider.name.must_equal "Twitter"
  end

  it "should parse the entry's verb" do
    @entry.activity_verb.must_equal "http://activitystrea.ms/schema/1.0/post"
  end

  it "should parse the entry's object's link's href" do
    @entry.activity_object.links[0].href.must_equal "http://twitter.com/greeneyedtengu/statuses/180761363340197888"
  end

  it "should parse the entry's object's categories's term" do
    @entry.activity_object.categories[0].term.must_equal "cat"
    @entry.activity_object.categories[1].term.must_equal "dog"
  end

  it "should parse the entry's object's id" do
    @entry.activity_object.id.must_equal "object:tag:search.twitter.com,2005:180761363340197888"
  end

  it "should parse the entry's object's gnip:statistics" do
    @entry.activity_object.gnip_statistics.favoriteCount.must_equal 10
  end

  it "should parse the entry's object's georss:point" do
    @entry.activity_object.georss_point.must_equal "37.4934592 -120.8473432"
  end

  it "should parse the author's name" do
    @entry.author.name.must_equal "greeneyedtengu"
  end

  it "should parse the namespaced author's namespaced object-type" do
    @entry.activity_author.object_type.must_equal "http://activitystrea.ms/schema/1.0/person"
  end

  it "should parse the namespaced author's differently namespaced id" do
    @entry.activity_author.id.must_equal "http://twitter.com/greeneyedtengu"
  end

  it "should parse the namespaced author's avatar image" do
    @entry.activity_author.avatar_image.must_equal "http://a0.twimg.com/profile_images/1886588117/profile_normal.jpg"
  end

  it "should parse the namespaced author's links into an arrary" do
    @entry.activity_author.links.must_be_kind_of Array
  end

  it "should parse all of the namespaced author's links" do
    @entry.activity_author.links.size.must_equal 2
  end

  it "should parse the namespaced actor's differently namespaced id" do
    @entry.activity_actor.id.must_equal "http://twitter.com/greeneyedtengu"
  end

  it "should parse the namespaced actor's links into an arrary" do
    @entry.activity_actor.links.must_be_kind_of Array
  end

  it "should parse all of the namespaced actor's links" do
    @entry.activity_actor.links.size.must_equal 2
  end

  it "should parse the matching rules" do
    @entry.matching_rules.first.rule.must_equal "apartments"
  end

  it "should parse multiple matching rules" do
    @entry = GnipGnop::Entry.parse(File.read(File.expand_path('../fixtures/entry_with_rules.xml', __FILE__)))
    @entry.matching_rules.size.must_equal 2
  end

  it "should render xml properly" do
    result_xml = Nokogiri::XML(GnipGnop::Entry.parse(@entry.to_xml).to_xml)
    expected_xml = Nokogiri::XML(xml)
    expected_namespaces = {
                            "xmlns:atommedia" => "http://purl.org/syndication/atommedia",
                            "xmlns:georss"    => "http://www.georss.org/georss",
                            "xmlns:thr"       => "http://purl.org/syndication/thread/1.0",
                            "xmlns:gnip"      => "http://www.gnip.com/schemas/2010",
                            "xmlns:service"   => "http://activitystrea.ms/service-provider",
                            "xmlns:activity"  => "http://activitystrea.ms/spec/1.0/",
                            "xmlns"           => "http://www.w3.org/2005/Atom"
                          }
    result_xml.collect_namespaces.must_equal expected_namespaces

    expected_xml.remove_namespaces!
    result_xml.remove_namespaces!

    assert_xml_equal(expected_xml.to_xml, result_xml.to_xml)
  end
end
