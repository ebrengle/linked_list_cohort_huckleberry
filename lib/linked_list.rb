require_relative 'linked_list_item'

class LinkedList

  def initialize(*args)
    @indexCounter = -1
    args.each do |item|
      push(item)
    end
  end

  def get(nth_item)
    raise IndexError.new("index can't be negative") if nth_item < 0
    if nth_item == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < nth_item
        raise IndexError.new("doesn't doesn't exist") if current_node.nil?

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

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " ":", "
      str << punctuation
      current_item = current_item.next_item
    end
    str << "|"
    str
  end
end
