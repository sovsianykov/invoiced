class Api::V1::ContactsController < ApplicationController
  before_action :find_contact , only: [:show, :update, :destroy]

  def index
    @contacts = Contact.all

    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.create(contact_params)

    @contact.save
    render json: @contact, status: :created
  end

  def destroy
   if @contact.destroy
    head(:ok)
   else
    head(:unprocessable_entity)
   end
  end

  def update
    if @contact.update(album_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private
  
  def find_contact
    @contact = Contact.where(id: params[:id]).first
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
