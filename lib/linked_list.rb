require_relative 'linked_list_item'

class LinkedList

  def initialize
    @indexCounter = -1
  end

  def get(nth_item)
    raise IndexError if nth_item < 0
    if nth_item == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        raise IndexError if current_node.nil?

        current_node = current_node.next_item
        count = count + 1
      end
      current_node.payload
    end
  end

  def push(item)
    @indexCounter += 1
   if  @first_item.nil?
     @first_item = LinkedListItem.new(item)
     @last_item = @first_item
   else
     @last_item.next_item = LinkedListItem.new(item)
     @last_item = @last_item.next_item
   end

  end


  #Eliza's Push Method Demo
  #def push(payload)
    #if @first_item.nil?
    #@first_item = LinkedListItiem.new(payload)
    #else
      #last_item = @first_item
      #until last_item.last?
        #last_item = last_item.next_item
      #end
      #last_item.next_item = new.item
    #end
  #end

  def size
    @indexCounter += 1
  end

end
