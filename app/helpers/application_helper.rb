module ApplicationHelper
  def css_active(ctl, act)
    if controller.controller_name == ctl && controller.action_name == act
      "active"
    end
  end
end
