require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'Aged Brie'
    end

    it 'Decreases in quality by 1 before the sell-by date' do
      items = [Item.new('+5 Dexterity Vest', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 49
    end
  end
end
