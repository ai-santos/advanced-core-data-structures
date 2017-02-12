require_relative('../src/queue')

RSpec.describe Queue, "Methods" do
  before(:each) do
    @queue = Queue.new
  end

  context "enqueue" do 
    it "adds an element to the back of the queue" do
      @queue.enqueue('string1')

      expect(@queue.queue.value).to eql('string1')
    end
  end

  context "dequeue" do 
    it "removes an element to the back of the queue" do
      @queue.enqueue('string1')
      expect(@queue.dequeue.value).to eql('string1')

      expect(@queue.queue).to eql nil
    end

    it "returns nil if the queue is empty" do
      p(@queue.dequeue)
      expect(@queue.dequeue).to eql nil
    end
  end

  context "front" do 
    it "returns the front element in a queue" do
      @queue.enqueue('string1')
      @queue.enqueue('string2')

      expect(@queue.front.value).to eql('string1')
      expect(@queue.queue.next.value).to eql('string2') 
    end

    it "returns nil if the queue is empty" do
      expect(@queue.front).to eql nil
    end
  end

  context "back" do 
    it "returns the back element in a queue" do
      @queue.enqueue('string1')
      @queue.enqueue('string2')

      expect(@queue.back).to eql {{value: 'string2', next: nil}}
      expect(@queue.queue).to include({value: 'string1', next: {value: 'string2', next: nil}}) 
    end

    it "returns nil if the queue is empty" do
      expect(@queue.back).to eql nil
    end
  end

  context "isEmpty" do
    it "returns true when the queue is empty" do

      expect(@queue.isEmpty).to eql true
    end

    it "returns false if the queue is not empty" do
      @queue.enqueue('string1')

      expect(@queue.isEmpty).to eql false
    end
  end

  context "length" do
    it "returns the number of elements in the queue" do
      @queue.enqueue('string1')
      @queue.enqueue('string2')

      expect(@queue.length).to eql 2
    end
  end


end