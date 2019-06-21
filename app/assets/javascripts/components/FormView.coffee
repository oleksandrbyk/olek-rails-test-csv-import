# Configuration
UPLOAD_URL = '/uploads'

# Get CSRF token for rails
AuthenticityToken = $('meta[name="csrf-token"]').attr "content"

###
  FormView for CSV upload.
###
@FormView = Marionette.View.extend
  template: _.template('
    <div class="card mb-4">
      <div class="card-body">
        <form class="input-group">
          <div class="custom-file">
            <label class="custom-file-label" for=\'csv-file\'>Choose your CSV file</label>
            <input id=\'csv-file\' type="file" accept=".csv" class="form-control-file" name=\'file\'>
          </div>
          <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit">Submit</button>
          </div>
        </form>
      </div>
    </div>
  ')
  events:
    'submit form': 'upload'
  upload: (e) ->
    context = @
    e.preventDefault()
    formData = new FormData e.target
    formData.append('authenticity_token', AuthenticityToken)
    $.ajax
      type: 'POST'
      enctype: 'multipart/form-data'
      url: UPLOAD_URL
      data: formData
      processData: false
      contentType: false
      cache: false
      success: (data) ->
        context.collection.reset()
        context.collection.add data
        $(e.target).trigger 'reset'
        return