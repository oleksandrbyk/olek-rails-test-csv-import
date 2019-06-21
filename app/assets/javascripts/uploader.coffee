//= require models.coffee
//= require components/FormView.coffee
//= require components/TableView.coffee


#  View includes TableView and FormView.

RootView = Marionette.View.extend
  template: _.template('
    <div id="uploader"></div>
    <div id="datatable"></div>
  ')

  regions:
    uploader: '#uploader'
    datatable: '#datatable'

  onRender: ->
    @showChildView 'uploader', new FormView
      collection: @collection
    @showChildView 'datatable', new TableView
      collection: @collection
    return

Application = Marionette.Application.extend
  region: '#app'
  onStart: ->
    @showView new RootView
      collection: new CSVItems
    return

$(document).ready ->
  app = new Application
  app.start()