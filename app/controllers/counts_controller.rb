class CountsController < ApplicationController
  def new
  end

  def start
    count = Count.new(params[:name], params[:time])
    CountList.instance.add(count)
    count.async.start

    flash.now[:notice] = "START Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

  def stop
    count = CountList.instance.counts[params[:name]]
    count.stop

    flash.now[:notice] = "STOP Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

  def resume
    count = CountList.instance.counts[params[:name]]
    count.resume

    flash.now[:notice] = "RESUME Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end

  def collected
    count = CountList.instance.counts[params[:name]]
    count.collected

    flash.now[:notice] = "COLLECTED Request completed at #{Time.now} - count is #{count.name}"
    render :action => 'new'
  end
end
