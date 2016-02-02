class CountsController < ApplicationController
#  before_filter :init_list, only: :start

  def new
  end

  def start
    count = Count.new(params[:name], params[:time])
    CountList.instance.add(count)
    count.async.start

  #  @name = params[:name]

    flash.now[:notice] = "START Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

  def stop
    count = CountList.instance.counts[params[:name]]
    count.stop

  #  @name = params[:name]

    flash.now[:notice] = "STOP Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

  def resume
    count = CountList.instance.counts[params[:name]]
    count.resume

  #  @name = params[:name]

    flash.now[:notice] = "RESUME Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

private

#  def init_list
  #  CountList.instance.reset
#  end
end
