{ComponentRegistry} = require 'nylas-exports'

ExternalDomainWarning = require './external-domain-warning'
ExternalDomainNotificationBarWarning = require './external-domain-notification-bar-warning'

module.exports =
  # Activate is called when the package is loaded. If your package previously
  # saved state using `serialize` it is provided.
  #
  activate: (@state) ->
    ComponentRegistry.register ExternalDomainWarning,
      role: 'ThreadListIcon'
    ComponentRegistry.register ExternalDomainNotificationBarWarning,
      role: 'MessageListNotificationBar'

  # This **optional** method is called when the window is shutting down,
  # or when your package is being updated or disabled. If your package is
  # watching any files, holding external resources, providing commands or
  # subscribing to events, release them here.
  #
  deactivate: ->
    ComponentRegistry.unregister(ExternalDomainWarning)
    ComponentRegistry.unregister(ExternalDomainNotificationBarWarning)
