{ComponentRegistry} = require 'nylas-exports'

ExternalDomainWarning = require './external-domain-warning'
ExternalDomainNotificationBarWarning = require './external-domain-notification-bar-warning'

module.exports =
  activate: (@state) ->
    ComponentRegistry.register ExternalDomainNotificationBarWarning,
      role: 'MessageListHeaders'

  deactivate: ->
    ComponentRegistry.unregister(ExternalDomainWarning)
    ComponentRegistry.unregister(ExternalDomainNotificationBarWarning)
