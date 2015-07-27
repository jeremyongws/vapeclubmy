class SellingController < ApplicationController

  def single
  end

  def subscription
  end

  def single_checkout
  	# if checkbox checked, create user_account
    if params[:createaccount] == "1"
      password = (0...8).map { (65 + rand(26)).chr }.join
      User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                  email: params[:billing_email], password: password, 
                  password_confirmation: password,
                  member: false)
    end
  	# send thank you mailer with user password
  	# parse parameters to iPay88 API
  	# callback to thank you
  end

  def subscription_checkout
    # if checkbox checked, create user_account
    if params[:createaccount] == "1"
      password = (0...8).map { (65 + rand(26)).chr }.join
      User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                  email: params[:billing_email], password: password, 
                  password_confirmation: password,
                  member: true)
    end
  	# send thank you mailer with user password
  	# parse parameters to iPay88 API
  	# callback to thank you
  end

  def thank_you
  	@count = User.all.count + 1213
  end

end
