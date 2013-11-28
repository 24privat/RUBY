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


-- LEVEL 4 --

1. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }
  before{zombie.eat_brains}
  it 'is not a dummy zombie' do
     zombie.should_not be_dummy
  end

  it 'is a genius zombie' do
    zombie.should be_genius
  end
end

2. describe Zombie do
  let(:zombie) { Zombie.new }
  before { zombie.iq = 0 }
  subject { zombie }

  it { should be_dummy }

  context 'with a smart zombie' do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end

3. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }

  context 'with a dummy zombie' do
    before { zombie.iq = 0 }
    it { should be_dummy }
  end

  context 'with a smart zombie' do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end

4. shared_examples_for 'the brainless' do
  it { should be_dummy }
  it { should_not be_genius }
end

describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }
  it_behaves_like 'the brainless'
end

describe Plant do
  let(:plant) { Plant.new }
  subject { plant }
  it_behaves_like 'the brainless'
end

5. describe Zombie do
  let(:zombie) { Zombie.new }
  subject { zombie }

  context 'with a dummy zombie' do
    before { zombie.iq = 0 }
    it { should be_dummy }
  end

  context 'with a smart zombie' , focus: true do
    before { zombie.iq = 3 }
    it { should_not be_dummy }
  end
end


-- LEVEL 5 --

1. describe ZombieMailer do
  context '#tweet' do
    let(:zombie) { stub(email: 'anything@example.org') }
    let(:tweet) { stub(message: 'Arrrrgggghhhh') }

    subject { ZombieMailer.tweet(zombie, tweet) }
    its(:from) { should include('admin@codeschool.com') }
    its(:to) { should include(zombie.email) }
    its(:subject) { should == tweet.message }
  end
end

2. describe ZombieMailer do
  context '#tweet' do
    let(:zombie) { stub(:zombie, email: 'anything@example.org') }
    let(:tweet) { stub(:tweet, message: 'Arrrrgggghhhh') }

    subject { ZombieMailer.tweet(zombie, tweet) }
    its(:from) { should include('admin@codeschool.com') }
    its(:to) { should include(zombie.email) }
    its(:subject) { should == tweet.message }
  end
end

3. describe Tweet do
  context 'after create' do
    let(:zombie) { Zombie.create(email: 'anything@example.org') }
    let(:tweet) { zombie.tweets.new(message: 'Arrrrgggghhhh') }

    it 'calls "email_tweeter" on the tweet' do
      tweet.should_receive(:email_tweeter)
      tweet.save
    end
  end
end


