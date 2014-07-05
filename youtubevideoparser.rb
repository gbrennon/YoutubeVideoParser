require 'net/http'
require 'rexml/document'
include REXML

class YoutubeVideoParser

  def initialize(user, num)
    url_base = "http://gdata.youtube.com/feeds/api/users/#{user}/uploads?max-results=#{num}"
    xml = Net::HTTP.get_response(URI.parse(url_base)).body
    @doc = REXML::Document.new(xml)
  end

  def video_list
    video_paths = get_paths
    video_titles = get_titles

    Hash[video_titles.zip(video_paths)]
  end

  private
  def get_titles
    video_titles = Array.new
    XPath.each(@doc, '//media:title') do |title|
      title = String(title).split('>')
      title = title[1].split('<')
      video_titles << title[0]
    end
    video_titles
  end

  def get_paths
    video_paths = Array.new
    XPath.each(@doc, '//media:player') do |video|
<<<<<<< HEAD
      video = video.attribute('url')
      video = String(video).split('url')
      videopath << video[0]
=======
      video_paths << video.attribute('url').to_s
>>>>>>> 12c1244b9c0e71f769dc3d96f3f30983c76d461d
    end
    video_paths
  end
end
