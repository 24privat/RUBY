-- LEVEL 3 --

3. describe Zombie do
  it { should_not be_genius }
  its(:iq) { should == 0 }

  context "with high iq" do
    subject { Zombie.new(iq: 3) }
    it { should be_genius }
    its(:brains_eaten_count) { should == 1 }
  end
end

4. describe Zombie do
  let(:zombie) { Zombie.new(tweets: [tweet]) }
  let(:tweet) { Tweet.new }

  subject { zombie }

  its(:tweets) { should include(tweet) }

  it "should have a latest tweet" do
    zombie.latest_tweet.should == tweet
  end
end