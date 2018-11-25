require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'SellIn decreases by 1 per day' do
      items = [Item.new('+5 Dexterity Vest', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
    end

    it 'Decreases in quality by 1 before the sell-by date' do
      items = [Item.new('+5 Dexterity Vest', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 49
    end

    it 'Once the sell by date has passed, Quality degrades twice as fast' do
      items = [Item.new('+5 Dexterity Vest', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 48
    end

    it 'The Quality of an item is never negative' do
      items = [Item.new('+5 Dexterity Vest', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'Aged Brie increases in Quality the older it gets' do
      items = [Item.new('Aged Brie', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 11
    end

    it 'Aged Brie increases in Quality past sell-by date' do
      items = [Item.new('Aged Brie', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
    end

    it "The Quality of an item is never more than 50" do
      items = [Item.new('Aged Brie', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end
end
