module ApplicationHelper

	class ActionView::Helpers::FormBuilder
	  include ActionView::Helpers::TagHelper
	  include ActionView::Helpers::FormTagHelper
	  include ActionView::Helpers::FormOptionsHelper
	  include ActionView::Helpers::CaptureHelper
	  include ActionView::Helpers::AssetTagHelper

  	def datepicker_input form, field
    	content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
      		form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
    	end
  	end

	end
end
