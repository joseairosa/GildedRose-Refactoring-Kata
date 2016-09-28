require File.join(File.dirname(__FILE__), '..', 'goldshire_inn')

describe GoldshireInn do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GoldshireInn.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end
