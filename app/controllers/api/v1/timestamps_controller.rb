class Api::V1::TimestampsController < ApplicationController
  before_action :set_timestamp

  def show
  end

  private
    def set_timestamp     
      @timestamp = MyTimestamp.new(params[:id])
    end
end