require_relative 'youtubevideoparser'
require 'minitest/autorun'

describe "YoutubeVideoParser" do
    before do
      @ivp = YoutubeVideoParser.new('glauberbrennon', 1)
    end

    it "must return a hash with video title and video URL " do
      video_list = @ivp.video_list
      assert_equal(video_list.key?('Apr 5, 2014'), true)
       assert_equal(video_list['Apr 5, 2014'], "http://www.youtube.com/watch?v=vslqDVI9x_4&amp;feature=youtube_gdata_player")
    end
end
