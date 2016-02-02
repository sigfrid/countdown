class Count
  include Concurrent::Async

  COUNTLOGGER = Logger.new("#{Rails.root}/log/counts.log")

  attr_accessor :name

  def initialize(name, time)
    super()
    @name = name
    @time = Integer(time)
    @stop = false
  end

  def start
    if @stop == false && @time > 0
      @time -= 1
      COUNTLOGGER.info("#{@name} #{@time}")
      sleep 1
      start
    elsif @time == 0
      COUNTLOGGER.info("#{@name} DONE !!!")
    end
  end

  def stop
    COUNTLOGGER.info("#{@name} STOP")
    @stop = true
  end

  def resume
    COUNTLOGGER.info("#{@name} RESUME")
    @stop = false
    start
  end
end
