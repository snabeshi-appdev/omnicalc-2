class MathController < ApplicationController

  def blank_add
    render({:template => "calculation_templates/add_form.html.erb"})
  end

  def blank_subtract
    render({:template => "calculation_templates/subtract_form.html.erb"})
  end

  def blank_multiply
    render({:template => "calculation_templates/multiply_form.html.erb"})
  end

  def blank_divide
    render({:template => "calculation_templates/divide_form.html.erb"})
  end

  def blank_divide
    render({:template => "calculation_templates/divide_form.html.erb"})
  end

  def calculate_add
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    render({:template => "calculation_templates/add_results.html.erb"})
  end

  def calculate_subtract
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    render({:template => "calculation_templates/subtract_results.html.erb"})
  end

  def calculate_multiply
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    render({:template => "calculation_templates/multiply_results.html.erb"})
  end

  def calculate_divide
    @first_num = params.fetch("first_num").to_f
    @second_num = params.fetch("second_num").to_f
    render({:template => "calculation_templates/divide_results.html.erb"})
  end


end
