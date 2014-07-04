require 'net/http'
require 'rexml/document'
include REXML

class YoutubeVideoParser
  attr_reader :user, :video, :num

  def initialize(user, num)
    @user = user
    @num = num
    @url_base = "http://gdata.youtube.com/feeds/api/users/#{@user}/uploads?max-results=#{@num}"
    @xml = Net::HTTP.get_response(URI.parse(@url_base)).body
    @doc = REXML::Document.new(@xml)
  end

  def listvideo
    videopath = Array.new
    videotitle = Array.new

    XPath.each(@doc, '//media:title')  do |title| 
      title = String(title).split('>')
      title = title[1].split('<')
      videotitle << title[0]
    end

    XPath.each(@doc, '//media:player') do |video|
      videopath << video.attribute('url')
    end

    @video = Hash[videotitle.zip(videopath)]
  end
end
