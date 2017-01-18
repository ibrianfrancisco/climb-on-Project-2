module ApplicationHelper

  def gravatar_for(user)
    gravatar_url = user.image
    if user.image?
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    else
      image_tag "/assets/noprofile.png", class: "gravatar"
    end
  end

end
