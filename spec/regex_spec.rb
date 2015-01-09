require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Autolinks::Regex do
  describe "handle" do
    it "matches the handles in the Test String" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.handle).flatten).to eq ["@thishandle", "@thisotherhandle"]
    end

    it "matches the handles in the Test String" do
      expect("Follow @mindtonic for more info".scan(Autolinks::Regex.handle).flatten).to eq ["@mindtonic"]
    end
  end

  describe "handle_name" do
    it "matches the handles in the Test String without the @" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.handle_name).flatten).to eq ["thishandle", "thisotherhandle"]
    end

    it "matches the handles in the Test String without the @" do
      expect("Follow @mindtonic for more info".scan(Autolinks::Regex.handle_name).flatten).to eq ["mindtonic"]
    end
  end

  describe "http", focus: true do
    it "matches the complete urls in the Test String" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.http).flatten).to eq ["http://google.com", "http://google.com", "http://google.co.uk"]
    end

    Autolinks::TEST_URLS.each do |link|
      it "matches #{link}" do
        expect(link.scan(Autolinks::Regex.http).flatten).to eq [link.gsub(/\W$/, '')]
      end
    end
  end

  describe "http_address", focus: true do
    it "matches the complete urls in the Test String" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.http_address).flatten).to eq ["google.com", "google.com", "google.co.uk"]
    end

    Autolinks::TEST_URLS.each do |link|
      it "matches #{link}" do
        expect(link.scan(Autolinks::Regex.http_address).flatten).to eq [link.gsub(/https?:\/\//, '').gsub(/\W$/, '')]
      end
    end
  end

  describe "hashtag" do
    it "matches the hashtags in the Test String" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.hashtag).flatten).to eq %w{#communicates #hashtags #marked #content #1}
    end

    it "matches the hashtags in the Test String" do
      expect("Follow @mindtonic for more #info".scan(Autolinks::Regex.hashtag).flatten).to eq ["#info"]
    end
  end

  describe "hashtag_name" do
    it "matches the hashtags in the Test String without the #" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.hashtag_name).flatten).to eq %w{communicates hashtags marked content 1}
    end

    it "matches the hashtags in the Test String without the #" do
      expect("Follow @mindtonic for more #info".scan(Autolinks::Regex.hashtag_name).flatten).to eq ["info"]
    end
  end

  describe "email" do
    it "matches the email in the Test String" do
      expect(Autolinks::TEST_STRING.scan(Autolinks::Regex.email).flatten).to eq ["email@email.com"]
    end

    ["mindtonic@gmail.com", "testing@example.co.uk", "my.email@example.com"].each do |email|
      it "matches #{email}" do
        expect(email.scan(Autolinks::Regex.email).flatten).to eq [email]
      end
    end

    it "does not match emails if there are not any" do
      expect(Faker::Lorem.paragraph.scan(Autolinks::Regex.handle_name).flatten).to eq []
    end
  end
end