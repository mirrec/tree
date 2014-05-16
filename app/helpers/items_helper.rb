module ItemsHelper
	def nested_items(items)
    items.map do |item, sub_items|
      render(item) + content_tag(:div, nested_items(sub_items), :class => "nested_items")
    end.join.html_safe
  end

  

end
