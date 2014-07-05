require_relative 'youtubevideoparser'
require 'minitest/autorun'

describe "YoutubeVideoParser" do
<<<<<<< HEAD


before do
  @youtube = YoutubeVideoParser.new('glauberbrennon', 1)
  @url = 'http://www.youtube.com/watch?v=vslqDVI9x_4;feature=youtube_gdata_player'
end

  it "must be 'glauberbrennon'" do
  assert_equal(@youtube.user, 'glauberbrennon')
  end

  it "must be 1" do
  assert_equal(@youtube.num, 1)
  end

  it "must return a hash with video title and video URL " do
    assert_instance_of(Hash, @youtube.listvideo)
    assert_equal(@youtube.video.key?('Apr 5, 2014'), true)
    assert_equal(@youtube.video['Apr 5, 2014'], 'http://www.youtube.com/watch?v=vslqDVI9x_4&amp;feature=youtube_gdata_player' )
=======
  before do
    @ivp = YoutubeVideoParser.new('glauberbrennon', 1)
  end

  it "must return a hash with video title and video URL " do
    video_list = @ivp.video_list
    assert_equal(video_list.key?('Apr 5, 2014'), true)
    assert_equal(video_list['Apr 5, 2014'], "http://www.youtube.com/watch?v=vslqDVI9x_4&amp;feature=youtube_gdata_player")
>>>>>>> 12c1244b9c0e71f769dc3d96f3f30983c76d461d
  end
end
