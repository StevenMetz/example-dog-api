class DogsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    dogs = Dog.all
    render json: dogs.as_json
  end

  def create
    dog = Dog.new(
      name: params[:name],
      breed: params[:breed],
      age: params[:age],
      user_id: current_user.id,
    )
    if dog.save
      render json: dog
    else
      render json: { message: "dog didnt save" }
    end
  end

  def update
    dog = Dog.find_by(id: params["id"])
    dog.name = params["name"] || dog.name
    dog.breed = params["breed"] || dog.breed
    dog.age = params["age"] || dog.age
    @dog = dog
    if product.save
      render json: dog
    else
      render json: { errors: product.errors.full_messages }, status: 418
    end
  end

  def delete
    dog = Dog.find_by(id: params["id"])
    dog.destroy
    render json: { message: "Dog Removed" }
  end
end
