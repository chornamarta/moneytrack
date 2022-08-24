class ExpensesController < ApplicationController

  def index 
    @expenses = current_user.expenses
  end

  def new 
    @expense = Expense.new
  end

  def create 
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      flash[:notice] = "Expense was created successfully."
      redirect_to expenses_path
    else
      render 'new'
    end
  end

  def destroy 
    Expense.where(user_id: current_user.id).destroy_all
    redirect_to root_path
  end

  def count_cat
    @expenses = current_user.expenses.group(:category).sum(:cost)
  end

  private
  def expense_params
    params.require(:expense).permit(:category,:cost, :date)
  end

end
