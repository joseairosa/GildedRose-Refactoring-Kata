require File.join(File.dirname(__FILE__), '..', 'goldshire_inn')

describe GoldshireInn do

  let(:name) { 'foo' }
  let(:sell_in) { 10 }
  let(:quality) { 25 }
  let(:items) { [Item.new(name, sell_in, quality)] }

  describe "#update_quality" do

    subject { GoldshireInn.new(items).update_quality() }

    context "When updating the item, the name of the item" do
      it "does not change" do
        subject
        expect(items[0].name).to eq "foo"
      end
    end

    context "When quality is 50" do
      let(:name) { 'Aged Brie' }
      let(:quality) { 50 }
      it "Quality never increases above 50" do
        expect{subject}.to change{items[0].quality}.by(0)
      end
    end

    it "subtracts one from quality per day" do
      expect{subject}.to change{items[0].quality}.by(-1)
    end

    it "subtracts one from SellIn per day" do
      expect{subject}.to change{items[0].sell_in}.by(-1)
    end

    context "When the SellIn is at zero" do
      let(:sell_in) { 0 }
      it "subtracts two from quality per day" do
        expect{subject}.to change{items[0].quality}.by(-2)
      end

      it "checks that SellIn is able to go into the negative values" do
        expect{subject}.to change{items[0].sell_in}.by(-1)
      end
    end

    context "When the quality is at zero" do
      let(:quality) { 0 }
      it "checks that quality remains at 0 if it started at 0" do
        expect{subject}.to change{items[0].quality}.by(0)
      end
    end

    context "When the Item is Aged Brie" do
      let(:name) { 'Aged Brie' }
      it "checks that quality increases over time by 1" do
        expect{subject}.to change{items[0].quality}.by(1)
      end
    end

    context "When the item is Sulfuras, Hand of Ragnaros" do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:quality) { 80 }
      it "checks that quality never changes and remains at 80" do
        subject
        expect(items[0].quality).to eq 80
      end

      it "checks that SellIn does not decrease" do
        expect{subject}.to change{items[0].sell_in}.by(0)
      end

    end

  end

end
