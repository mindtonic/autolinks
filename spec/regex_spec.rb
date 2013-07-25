require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Autolinks::Regex do
  describe "handle" do
    it "should match the handles in the Test String" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.handle).flatten.should == ["@thishandle", "@thisotherhandle"]
    end

    it "should match the handles in the Test String" do
      "Follow @mindtonic for more info".scan(Autolinks::Regex.handle).flatten.should == ["@mindtonic"]
    end
  end

  describe "handle_name" do
    it "should match the handles in the Test String without the @" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.handle_name).flatten.should == ["thishandle", "thisotherhandle"]
    end

    it "should match the handles in the Test String without the @" do
      "Follow @mindtonic for more info".scan(Autolinks::Regex.handle_name).flatten.should == ["mindtonic"]
    end
  end

  describe "http", focus: true do
    it "should match the complete urls in the Test String" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.http).flatten.should == ["http://google.com", "http://google.com", "http://google.co.uk"]
    end

    Autolinks::TEST_URLS.each do |link|
      it "should match #{link}" do
        link.scan(Autolinks::Regex.http).flatten.should == [link.gsub(/\W$/, '')]
      end
    end
  end

  describe "http_address", focus: true do
    it "should match the complete urls in the Test String" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.http_address).flatten.should == ["google.com", "google.com", "google.co.uk"]
    end

    Autolinks::TEST_URLS.each do |link|
      it "should match #{link}" do
        link.scan(Autolinks::Regex.http_address).flatten.should == [link.gsub(/https?:\/\//, '').gsub(/\W$/, '')]
      end
    end
  end

  describe "hashtag" do
    it "should match the hashtags in the Test String" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.hashtag).flatten.should == %w{#communicates #hashtags #marked #content #1}
    end

    it "should match the hashtags in the Test String" do
      "Follow @mindtonic for more #info".scan(Autolinks::Regex.hashtag).flatten.should == ["#info"]
    end
  end

  describe "hashtag_name" do
    it "should match the hashtags in the Test String without the #" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.hashtag_name).flatten.should == %w{communicates hashtags marked content 1}
    end

    it "should match the hashtags in the Test String without the #" do
      "Follow @mindtonic for more #info".scan(Autolinks::Regex.hashtag_name).flatten.should == ["info"]
    end
  end

  describe "email" do
    it "should match the email in the Test String" do
      Autolinks::TEST_STRING.scan(Autolinks::Regex.email).flatten.should == ["email@email.com"]
    end

    ["mindtonic@gmail.com", "testing@example.co.uk", "my.email@example.com"].each do |email|
      it "should match #{email}" do
        email.scan(Autolinks::Regex.email).flatten.should == [email]
      end
    end

    it "should not match emails if there are not any" do
      Faker::Lorem.paragraph.scan(Autolinks::Regex.handle_name).flatten.should == []
    end
  end
end