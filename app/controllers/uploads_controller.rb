class UploadsController < ApplicationController
  def create
    @people = CSVParser.parse(params[:file].tempfile)
    render  json: @people,
            status: :ok
  end
end
