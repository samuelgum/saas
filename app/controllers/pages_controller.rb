class PagesController < ApplicationController
    def home
      @basic_pay_plan = Pay_plan.find(1)  
      @pro_pay_plan = Pay_plan.find(2)  
    end
    
    def about
        
    end
end
