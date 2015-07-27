class SellingController < ApplicationController

  def single
  end

  def subscription
  end

  def single_checkout
    # maybe save sessions for user creation??
    # parse parameters to iPay88 API

  	# if API return payment made
    # if checkbox checked, create user_account
    if params[:createaccount] == "1"
      @password = (0...8).map { (65 + rand(26)).chr }.join
      @user = User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                  email: params[:billing_email], password: @password, 
                  password_confirmation: @password,
                  member: false)
      # send welcome mailer with user password
      UserMailer.welcome_email(@user, @password)
    end
  	# callback to thank you
  end

  def subscription_checkout
    # maybe save sessions for user creation??
    # parse parameters to iPay88 API
    # if API return payment made
    # if checkbox checked, create user_account
    byebug
    if params[:createaccount] == "1"
      @password = (0...8).map { (65 + rand(26)).chr }.join
      @user = User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                  email: params[:billing_email], password: @password, 
                  password_confirmation: @password,
                  member: true)
      # send welcome mailer with user password
      UserMailer.welcome_email(@user, @password)
    end
  	# callback to thank you
  end

  def thank_you
  	@count = User.all.count + 1213
  end

end
