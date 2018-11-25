require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'Aged Brie'
    end
  end
end
