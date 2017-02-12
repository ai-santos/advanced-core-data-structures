class Node
  attr_reader :value
  attr_reader :next

  def initialize(value, nextNode=nil)
    @value = value
    @next = nextNode
  end
end

class Queue
  attr_reader :queue

  def initialize
    @queue = nil
  end

  def enqueue(value)
    node = Node.new(value)
    if(@queue === nil)
      @queue = node
    else 
      match = false
      currentNode = @queue
      while(currentNode && !match)
        p(currentNode)
        p(currentNode[:@next])
        if(currentNode[:@next] === nil)
          currentNode.merge!(next: node)
          match = true
        end
        currentNode = currentNode[:next]
      end
    end
  end

  def dequeue()
    node = @queue
    if(@queue != nil)
      @queue = @queue.next
    end

    return node
  end

  def front
    return @queue
  end

  def back
    node = @queue
    while(node)
      if(node[:next] === nil)
        return node
      end
      node = node[:next]
    end
    return node
  end

end

