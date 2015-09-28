class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :pay_plan
  attr_accessor :stripe_card_token
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, pay_plan: pay_plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end