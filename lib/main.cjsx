{ComponentRegistry} = require 'nylas-exports'

ExternalDomainNotificationBarWarning = require './external-domain-notification-bar-warning'
ExternalDomainDraftWarning = require './external-domain-draft-warning'

module.exports =
  activate: (@state) ->
    ComponentRegistry.register ExternalDomainNotificationBarWarning,
      role: 'MessageListHeaders'
    ComponentRegistry.register ExternalDomainDraftWarning,
      role: 'Composer:Footer'

  deactivate: ->
    ComponentRegistry.unregister(ExternalDomainDraftWarning)
    ComponentRegistry.unregister(ExternalDomainNotificationBarWarning)
