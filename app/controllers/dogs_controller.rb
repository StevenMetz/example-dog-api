class DogsController < ApplicationController
  def index
    dogs = Dog.all
    render json: dogs.as_json
  end

  def create
    dog = Dog.new(
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
      user_id: current_user.id
    )
    if dog.save
      render json: dog
    else
      render json: { message: "dog didnt save" }
    end
  end
end
