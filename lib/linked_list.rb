require_relative 'linked_list_item'

class LinkedList

  def initialize(*args)
    @indexCounter = -1
    args.each do |item|
      push(item)
    end
  end

  def get_item(index)
    raise IndexError if index < 0
    if index == 0
      @first_item
    else
      current_node = @first_item
      index.times do
        raise IndexError if current_node.nil? or current_node.last?
        current_node = current_node.next_item
      end
      current_node
    end
  end

  def get(index)
    get_item(index).payload
  end

  alias [] get



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

  def []=(index, payload)
    previous_item = get(index - 1)
    next_item = get(index + 1)
    new_item = LinkedListItem.new(payload)

    previous_item.next_item = new_item
    new_item.next_item = next_item
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
