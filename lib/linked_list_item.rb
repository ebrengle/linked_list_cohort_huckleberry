class LinkedListItem
  include Comparable

  attr_reader :payload
  attr_reader :next_item
  attr :str

  def initialize(data)
    @payload = data
  end

  def === (other_item)
    self.equal? other_item
  end

  def next_item=(lli)
    raise ArgumentError if self.equal? (lli)
    @next_item = lli
  end

  def last?
    @next_item.nil?
  end

  def <=>(other)
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    end

    if self.payload.is_a? Symbol
      1
    elsif self.payload.is_a? Fixnum
      -1
    else
      -1 * (other <=> self)
    end
  end

end
