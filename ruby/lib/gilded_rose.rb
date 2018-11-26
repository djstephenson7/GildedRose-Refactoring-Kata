require_relative 'item'

# Gilded Rose Class
class GildedRose
  def initialize(item)
    @item = item
  end

  def new_day
    @item.each { |item| item.sell_in -= 1 }
  end

  def update_quality
    @item.each { |item| item.quality -= 1 }
  end

  # def update_quality
  #   @items.each do |item|
  #     item.sell_in -= 1 unless item.name.include? 'Sulfuras'
  #     if item.name == '+5 Dexterity Vest' || item.name == 'Elixir of the Mongoose'
  #       item.quality -= item.sell_in > 0 ? 1 : 2
  #       item.quality = 0 if item.quality < 0
  #     end
  #     if item.name == 'Aged Brie'
  #       item.quality += item.sell_in >= 0 ? 1 : 2
  #       item.quality = 50 if item.quality > 50
  #     end
  #     if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  #       item.quality += item.sell_in < 10 ? 2 : 1
  #       item.quality += 1 if item.sell_in < 5
  #       item.quality = 0 if item.sell_in < 0
  #       item.quality = 50 if item.quality > 50
  #     end
  #     if item.name.include? 'Conjured'
  #       item.quality -= item.sell_in >= 0 ? 2 : 4
  #     end
  #   end
  # end
end
