class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if params[:pay_plan]
        resource.pay_plan_id = params[:pay_plan]
        if resource.pay_plan_id == 2
          resource.save_with_payment
        else
          resource.save
        end
      end
    end
  end
end