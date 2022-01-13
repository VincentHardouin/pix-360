# frozen_string_literal: true

class EncryptionController < ApplicationController
  skip_before_action :create_encryption_password, only: %i[edit update]
  skip_before_action :provide_encryption_password, only: %i[index save edit update]
  before_action :encryption_already_set, only: %i[edit]

  def index; end

  def save
    if current_user.valid_password?(password_params)
      cookies.encrypted[:encryption_password] = password_params
      redirect_to root_url, notice: 'Votre mot de passe a bien été envoyé'
    else
      flash[:alert] = 'Le mot de passe saisie ne correspond pas.'
      render :index
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(password_params_from_edit)
      @user.create_encryption_keys
      redirect_to root_url, notice: 'Votre mot de passe a bien été ajouté'
    else
      render :edit
    end
  end

  private

  def password_params_from_edit
    params.require(:user).permit(:password, :password_confirmation, :must_change_password)
  end

  def password_params
    params.require(:user).permit(:password)
    params[:user][:password]
  end

  def encryption_already_set
    redirect_to root_url if encryption_ready?
  end
end
