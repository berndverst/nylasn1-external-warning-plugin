NylasStore = require 'nylas-store'

{Utils, DraftStore, React} = require 'nylas-exports'

class ExternalDomainStore extends NylasStore
  constructor: ->
    @_threadsWithExternalDomain = {}

  # Determines whether at least one thread participant is external.
  containsExternalDomain: (thread) =>
    if thread.id of @_threadsWithExternalDomain
      return @_threadsWithExternalDomain[thread.id]

    myDomains = {}
    otherDomains = {}

    thread.participants.forEach (p, i) =>
      domain = p.email.toLowerCase().split("@")[1].trim()
      if (p.isMe())
        if not (domain of myDomains)
          myDomains[domain] = true

      else
        if not (domain of myDomains)
          if not (domain of otherDomains)
            otherDomains[domain] = true

    otherDomains = Object.keys(otherDomains)
    for d, i in otherDomains
      if not (d of myDomains)
        @_threadsWithExternalDomain[thread.id] = true
        return true
    @_threadsWithExternalDomain[thread.id] = false
    return false

module.exports = new ExternalDomainStore
