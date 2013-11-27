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

4.
