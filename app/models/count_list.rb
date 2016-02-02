require 'singleton'

class CountList
  include Singleton

  attr_accessor :counts

  def initialize
    @counts = Hash.new
  end

  def add(count)
    @counts[count.name] = count
  end

  def reset
    @counts = {}
  end
end
