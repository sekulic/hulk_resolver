module ApplicationHelper
 
  def is_active_page?(link_path)
    if current_page?(link_path)
      return "active" if request.query_parameters.empty?     
    else
      ""
    end    
  end  
  
end
