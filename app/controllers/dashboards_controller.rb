class DashboardsController < ApplicationController        
    def hello
        if params[:counter].present?
            @counter = params[:counter].to_i
        else
            @counter = 0
        end

        if @counter == 2
            redirect_to dashboards_results_path
        end

       @meters = FourBeginnerMeter.take(2)
       @meter = @meters[@counter - 1]
        if params[:reading].present?
            @show_result = true            
            if params[:reading].to_i == @meter.reading
                @correct = true
            else 
                @correct = false
            end
        end
        @meter = @meters[@counter]
    end

    def results
        
    end
end