    offers = $('#offers')
    $(offers).empty()

<% if flash.now[:error].nil? %>
  <% if @empty %>
    offers.append("<%= j(render 'message' , message: flash.now[:success], type: 'alert-success' )%>")
  <% else %>
    offers.append("<%= j(render 'offers', offers: @json_response['offers'] )%>")
  <% end %>
<% else %>
    offers.append("<%= j(render 'message' , message: flash.now[:error] , type: 'alert-danger')%>")
<% end %>
    $('.offersSubmit').removeClass('disabled')
