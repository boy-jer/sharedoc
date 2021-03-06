module ApplicationHelper
  def name_with_avatar(user)
    link_to(user_path(username: user.username), class: "valign-wrapper") do
      image_tag(user.image_url, size: "24x24", class: "valign") + content_tag(:span, user.name, class: "valign")
    end
  end

  def presentation_image_tag(presentation)
    # TODO: 変換中を表現するメソッドを model に用意
    if presentation.image_file?
      image_tag(presentation.image_file_url, class: "blockimage")
    else
      image_tag("converting.png", size: "250x187", alt: "変換中", class: "blockimage")
    end
  end

  def mdi_icon(names, options = {})
    names = names.is_a?(Array) ? names : names.to_s.split(/\s+/)
    classes = ["mdi"]
    classes.concat names.map { |name| "mdi-#{name}" }
    classes.concat Array(options.delete(:class))
    content_tag(:i, nil, options.merge(class: classes))
  end
end
