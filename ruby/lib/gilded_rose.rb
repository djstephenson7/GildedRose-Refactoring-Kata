require_relative 'item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.sell_in -= 1 unless item.name.include? 'Sulfuras'
      if item.name == '+5 Dexterity Vest' || item.name == 'Elixir of the Mongoose'
        item.quality -= item.sell_in > 0 ? 1 : 2
        item.quality = 0 if item.quality < 0
      end
      if item.name == 'Aged Brie'
        item.quality += item.sell_in >= 0 ? 1 : 2
        item.quality = 50 if item.quality > 50
      end
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality += item.sell_in < 10 ? 2 : 1
        item.quality += 1 if item.sell_in < 5
        item.quality = 0 if item.sell_in < 0
        item.quality = 50 if item.quality > 50
      end
      if item.name.include? 'Conjured'
        item.quality -= item.sell_in >= 0 ? 2 : 4
      end
    end
  end

  # def update_quality
  #   @items.each do |item|
  #     if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
  #       if item.quality > 0
  #         if item.name != 'Sulfuras, Hand of Ragnaros'
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  #           if item.sell_in < 11
  #             item.quality = item.quality + 1 if item.quality < 50
  #           end
  #           if item.sell_in < 6
  #             item.quality = item.quality + 1 if item.quality < 50
  #           end
  #         end
  #       end
  #     end
  #     if item.name != 'Sulfuras, Hand of Ragnaros'
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != 'Aged Brie'
  #         if item.name != 'Backstage passes to a TAFKAL80ETC concert'
  #           if item.quality > 0
  #             if item.name != 'Sulfuras, Hand of Ragnaros'
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         item.quality = item.quality + 1 if item.quality < 50
  #       end
  #     end
  #     if item.name.include? 'Conjured'
  #       item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
  #     end
  #   end
  # end
end
