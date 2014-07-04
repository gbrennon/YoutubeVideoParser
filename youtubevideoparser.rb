require 'net/http'
require 'rexml/document'
include REXML

class YoutubeVideoParser
  attr_reader :user, :video, :result

  def initialize(user, result)
    @user = user
    @result = result
    @url_base = "http://gdata.youtube.com/feeds/api/users/#{@user}/uploads?max-results=#{@result}"
    @xml = Net::HTTP.get_response(URI.parse(@url_base)).body
    @doc = REXML::Document.new(@xml)
  end

  def listvideo
    videopath = XPath.each(@doc, '//media:player') { |video| }
  end
end