class Count
  include Concurrent::Async

  COUNTLOGGER = Logger.new("#{Rails.root}/log/counts.log")

  attr_accessor :name

  def initialize(name, time)
    super()
    @name = name
    @time = Integer(time)
    @stop = false
    @samples = 5
    @collected = 0
  end

  def start
    set_random
    step
  end

  def step
    if @stop == false && @time > 0
      @time -= 1
      if @time == @random_time
        COUNTLOGGER.info("#{@name} #{@time} TIME TO GET A SAMPLE !!!!")
      else
        COUNTLOGGER.info("#{@name} #{@time} - collected: #{@collected}/#{@samples}")
      end
      sleep 1
      step
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
    step
  end

  def collected
    @collected += 1
    set_random
  end

  def set_random
    if @collected < @samples
      interval = [(1..(@time/@samples)).to_a.sample, 5].max  
      @random_time = @time - interval
      COUNTLOGGER.info("RANDOM TIME: #{@random_time}")
    end
  end
end
