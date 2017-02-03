class ContactsController < ApplicationController

  def index
    if current_user
      @contacts = current_user.contacts
      #this makes it so the person who's logged in can only see their own contacts
      render "index.html.erb"
    else 
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/login'
    end
  end

  def new
  end

  def create
    @contact = Contact.new(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio],
                          user_id: current_user.id
                          )
    @contact.save
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.assign_attributes(
                              first_name: params[:first_name],
                              middle_name: params[:middle_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              phone_number: params[:phone_number],
                              bio: params[:bio]
                              )

    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy 
  end

end
