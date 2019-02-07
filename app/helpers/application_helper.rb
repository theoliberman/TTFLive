module ApplicationHelper

  def status
    Appstate.first.auto_update
  end

end
