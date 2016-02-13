module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title
    base_title = "Echo"
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-block"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
