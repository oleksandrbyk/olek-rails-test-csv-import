UPDATE_URL = '/people'

# Get CSRF token for rails
AuthenticityToken = $('meta[name="csrf-token"]').attr "content"


###
  View for each individual item.
  Shows input box if there are errors.
###
@RowView = Marionette.View.extend
  tagName: 'tr'
  template: _.template '
    <% if (errors === null || errors === "") { %>
      <td><%= id %></td>
      <td><%= first_name %></td>
      <td><%= last_name %></td>
      <td><%= email %></td>
      <td><%= phone %></td>
      <td><%= errors %></td>
      <td><button type="submit" class="btn btn-sm btn-success" disabled>Save</button></td>
    <% } else { %>
        <input type="hidden" value="<%= id %>" name="id">
        <td><%= id %></td>
        <td><input type="text" class="form-control" name="first_name" value="<%= first_name %>"></td>
        <td><input type="text" class="form-control" name="last_name" value="<%= last_name %>"></td>
        <td><input type="text" class="form-control" name="email" value="<%= email %>"></td>
        <td><input type="text" class="form-control" name="phone" value="<%= phone %>"></td>
        <td><%= errors %></td>
        <td><button type="submit" class="btn btn-sm btn-primary">Save</button></td>
    <% } %>
  '
  events:
    'click button': 'reSubmit'

  modelEvents:
    'change': 'render'

  reSubmit: (e) ->
    context = @
    dataToSend = {}
    _.each @$el.find('input'), (item) ->
      dataToSend[item.name] = item.value
    dataToSend['authenticity_token'] = AuthenticityToken

    $.ajax
      type: 'POST'
      contentType: 'application/json'
      url: UPDATE_URL
      data: JSON.stringify(dataToSend)
      processData: false
      cache: false
      success: (data) ->
        context.model.set(data)