# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def page_title
    "#{controller.action_name}"
  end
  
  
end
