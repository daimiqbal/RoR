class Contact < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :message, presence: true
  end
  
  # app/controllers/contacts_controller.rb
  class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(contact_params)
  
      if @contact.save
        flash[:success] = 'Your message has been sent!'
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
  end
  
  # app/views/contacts/new.html.erb
  <h1>New Contact</h1>
  
  <%= form_for(@contact) do |f| %>
    <div class="field">
      <%= f.label :name %>
      <%= f.text_field :name %>
    </div>
  
    <div class="field">
      <%= f.label :email %>
      <%= f.text_field :email %>
    </div>
  
    <div class="field">
      <%= f.label :message %>
      <%= f.text_area :message %>
    </div>
  
    <div class="actions">
      <%= f.submit 'Send Message' %>
    </div>
  <% end %>