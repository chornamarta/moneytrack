class ExpensesController < ApplicationController
  def index 
    @expenses = Expense.all
  end

  def new 
    @expense = Expense.new
  end

  def create 
    @expense = Expense.new(expense_params)
    # @article.user = current_user
    if @expense.save
      # flash[:notice] = "Article was created successfully."
      redirect_to expenses_path
    else
      render 'new'
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:category,:cost, :date)
  end
end
