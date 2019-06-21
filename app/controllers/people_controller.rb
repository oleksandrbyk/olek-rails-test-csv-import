class PeopleController < ApplicationController
  def create
    @person = Person.new(person_params)
    @person.save

    render json: @person, status: :ok
  end

  private

  def person_params
    params.permit(:first_name, :last_name, :email, :phone)
  end
end
