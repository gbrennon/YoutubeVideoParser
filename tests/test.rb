require_relative 'youtubevideoparser'
require 'minitest/autorun'

describe "a valid channel for YoutubeVideoParser" do
    before do
      @ivp = YoutubeVideoParser.new('glauberbrennon', 1)
    end

    it "must return a hash with video title and video URL " do
      video_list = @ivp.video_list
      assert_equal(true, video_list.key?('Apr 5, 2014'))
      assert_equal(video_list['Apr 5, 2014'], "http://www.youtube.com/watch?v=vslqDVI9x_4&amp;feature=youtube_gdata_player")
    end
end

describe 'a invalid channel for YoutubeVideoParser' do

    it "must be a invalid youtube channel" do
      assert_raises ArgumentError do
        @invalid_yvp = YoutubeVideoParser.new('invaliduser', 1)
      end
    end
end
