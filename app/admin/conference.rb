ActiveAdmin.register Conference do


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :description, :image, :created_at
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do #appears on Conference index
		column :id
		column :description do |conference|
			link_to conference.description, admin_conference_path(conference)
		end
		column :image_file_name
		column :created_at
	end

	#For Displaying Fields
	show do |conference|
      attributes_table do
      	row :description do
          conference.description#? ? link_to(item.instruction_file_name, item.instruction.url) : content_tag(:span, "No instruction file yet")
        end
        row :image do
          conference.image? ? image_tag(conference.image.url, height: '100') : content_tag(:span, "No photo yet")
        end
        row :created_at do
          conference.created_at#? ? link_to(item.instruction_file_name, item.instruction.url) : content_tag(:span, "No instruction file yet")
        end
      end
      active_admin_comments
   	end

	#For new and edit
	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do #creates a fieldset
			f.input :description
			f.input :image, hint: f.conference.image? ? image_tag(f.conference.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
			f.input :created_at
     	end
     	f.actions
   	end

end
