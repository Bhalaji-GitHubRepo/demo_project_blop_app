module ApplicationHelper

  def include_navbar?
    controller_name != 'sessions' && controller_name != 'registrations' && controller_name != 'passwords'
  end

end
