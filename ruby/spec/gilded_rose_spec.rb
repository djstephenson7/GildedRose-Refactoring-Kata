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

    it "State of Sulfuras, being a legendary item, never changes" do
      items = [Item.new('Sulfuras, Hand of Ragnaros', -1, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 80
    end

    it "Backstage passes increase in value if 11+ days from the concert" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 41
    end

    it "Backstage passes increase in value by 2 if 10 days from the concert" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 42
    end

    it "Backstage passes increase in value by 3 if 5 days from the concert" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 43
    end

    it "Backstage passes drop to 0 after the concert" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it "Conjured items degrade in Quality twice as fast as normal items" do
      items = [Item.new('Conjured Mana Cake', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 48
    end

    it "Conjured items degrade twice as fast after sell-by date" do
      items = [Item.new('Conjured Mana Cake', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 46
    end
  end
end
