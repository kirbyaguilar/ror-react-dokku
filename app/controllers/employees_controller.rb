class EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: {
      data: employees.as_json
    }, status: :ok
  end
end
