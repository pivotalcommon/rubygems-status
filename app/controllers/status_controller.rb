class StatusController < ApplicationController
  respond_to :html, :json

  def show
    @pings = Ping.all.sort_by { |x| x.service }

    crit = @pings.any? { |x| x.down? and x.critical? }

    if @pings.empty?
      @status = "unknown"
    elsif crit
      @status = "down"
    else
      @status = @pings.any? { |x| x.down? } ? "partial" : "up"
    end
    respond_with @status
  end
end
