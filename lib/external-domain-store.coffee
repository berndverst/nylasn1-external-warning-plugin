NylasStore = require 'nylas-store'
{AccountStore} = require 'nylas-exports'

class ExternalDomainStore extends NylasStore
  constructor: ->
    @_threadsWithExternalDomain = {}

  # Determines whether at least one thread participant is external.
  containsExternalDomain: (thread) =>
    if thread.id of @_threadsWithExternalDomain
      return @_threadsWithExternalDomain[thread.id]

    myDomains = {}

    account = AccountStore.accountForId(thread.accountId)
    myDomains[account.emailAddress.split("@")[1].trim()] = true
    for alias in account.aliases
      myDomains[alias.email.split("@")[1].trim()] = true

    thread.participants.forEach (p, i) =>
      domain = p.email.toLowerCase().split("@")[1].trim()
      if not (domain of myDomains)
        @_threadsWithExternalDomain[thread.id] = true
        return true
    @_threadsWithExternalDomain[thread.id] = false
    return false

module.exports = new ExternalDomainStore
