module MessagesHelper
	def user_avatar(user, size: 40)
	  if user.image.attached?
	    image_tag user.image, size: "#{size}x#{size}", class: "rounded-circle me-3"
	  else
	    content_tag :div, user.name[0].upcase,
	      class: "rounded-circle bg-secondary text-white d-flex justify-content-center align-items-center me-3",
	      style: "width: #{size}px; height: #{size}px; font-size: 0.9rem;"
	  end
	end

end
