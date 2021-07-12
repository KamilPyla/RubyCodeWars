#! /usr/bin/env ruby
# PaginationHelper
# 

class PaginationHelper
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  def item_count
    @collection.length
  end
	
  def page_count
    (item_count.to_f / @items_per_page).ceil 
  end
	
  def page_item_count(page_index)
    if page_index < 0 or page_index > (page_count - 1)
      -1
    elsif page_index + 1 <= (item_count / @items_per_page)
      @items_per_page
    else 
      item_count % @items_per_page
    end
  end
	
  def page_index(item_index)
    if item_index < 0 or item_index > item_count - 1
      -1
    else
      (item_index + 1) / @items_per_page
    end
  end
end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
puts helper.page_count() # should == 2
puts helper.item_count() # should == 6
puts helper.page_item_count(0)  # should == 4
puts helper.page_item_count(1) # last page - should == 2
puts helper.page_item_count(2) # should == -1 since the page is invalid

# page_index takes an item index and returns the page that it belongs on
puts helper.page_index(5) # should == 1 (zero based index)
puts helper.page_index(2) # should == 0
puts helper.page_index(100) # should == -1
puts helper.page_index(-10) # should == -1 because negative indexes are invalid

