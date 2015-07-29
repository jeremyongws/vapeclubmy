class SellingController < ApplicationController

  def single
  end

  def subscription
  end

  def single_checkout
    # maybe save sessions for user creation??
    
    # parse parameters to iPay88 API

  	# if API return payment made

    password_generation
    @user = User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                email: params[:billing_email], password: @password, 
                password_confirmation: @password,
                member: false)
    # send welcome mailer with user password
    @mail = UserMailer.welcome_email(@user.email, @password)
    @mail.deliver_now
    render :thank_you
  	# callback to thank you
  end

  def subscription_checkout
    # maybe save sessions for user creation??

    # parse parameters to iPay88 API
    
    # if API return payment made
    
    password_generation
    @user = User.create(name: params[:billing_first_name] + " " + params[:billing_last_name],
                email: params[:billing_email], password: @password, 
                password_confirmation: @password,
                member: true)
    # send welcome mailer with user password
    @mail = UserMailer.welcome_email(@user, @password)
    @mail.deliver_now
  	# callback to thank you
    render :thank_you
  end

  def thank_you
  	@count = User.all.count + 1213
  end

    private
      def password_generation
        @password = (0...8).map { (65 + rand(26)).chr }.join
      end

end
