class TestsController < ApplicationController
    before_action :get_user
    before_action :set_test, only: [:show, :edit, :update, :destroy]

    def results
        @score = @user.tests.find(params[:id]).score
    end

    def show
        if params[:counter].present?
            @counter = params[:counter].to_i
        else
            @counter = 0
        end

        if @counter == 2
            redirect_to results_user_test_path(@user, @test)
        end

       @meters = FourBeginnerMeter.take(2)
       @meter = @meters[@counter - 1]
        if params[:reading].present?
            @show_result = true            
            if params[:reading].to_i == @meter.reading
                @correct = true
                @test.increment!(:score)
            else 
                @correct = false
            end
        end
        @meter = @meters[@counter]
    end

    def index
        
    end

    def new
        @test = @user.tests.build
    end

    def edit
        
    end

    def create
        @test = @user.tests.build

        respond_to do |format|
            if @test.save
                format.html { redirect_to user_test_path(@user, @test), notice: 'Test was successfully created' }                
                format.json { render :show, status: :created, location: @test }
            else
                format.html { render :new }
                format.json { render json: @test.errors, status: :unprocessable_entity }  
            end
            
        end
    end

    def update
        respond_to do |format|
          if @test.update(test_params)
            format.html { redirect_to post_test_path(@user), notice: 'Test was successfully updated.' }
            format.json { render :show, status: :ok, location: @test }
          else
            format.html { render :edit }
            format.json { render json: @test.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @test.destroy
        respond_to do |format|
          format.html { redirect_to post_tests_path(@user), notice: 'Test was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

    def set_test
        @test = @user.tests.find(params[:id])
    end

      def get_user
        @user = User.find(params[:user_id])
      end
end