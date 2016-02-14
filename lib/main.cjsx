{ComponentRegistry} = require 'nylas-exports'

ExternalDomainNotificationBarWarning = require './external-domain-notification-bar-warning'

module.exports =
  activate: (@state) ->
    ComponentRegistry.register ExternalDomainNotificationBarWarning,
      role: 'MessageListHeaders'

  deactivate: ->
    ComponentRegistry.unregister(ExternalDomainNotificationBarWarning)
