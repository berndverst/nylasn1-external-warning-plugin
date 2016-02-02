# # External Domain Warning
#
# Show an icon for each thread to indicate whether you're the only recipient,
# one of many recipients, or a member of a mailing list.

# Access core components by requiring `nylas-exports`.
{Utils, DraftStore, React} = require 'nylas-exports'
# Access N1 React components by requiring `nylas-component-kit`.
{RetinaImg} = require 'nylas-component-kit'

class ExternalDomainWarning extends React.Component

  # Note: You should assign a new displayName to avoid naming
  # conflicts when injecting your item
  @displayName: 'ExternalDomainWarning'


  # In the constructor, we're setting the component's initial state.
  constructor: (@props) ->
    console.log "Entered constructor"
    @state =
      hasExternal: @_containsExternalDomain(@props.thread)

  # React components' `render` methods return a virtual DOM element to render.
  # The returned DOM fragment is a result of the component's `state` and
  # `props`. In that sense, `render` methods are deterministic.
  render: =>
    <div className="external-warning-icon">
      {@_renderIcon()}
    </div>

  # Some application logic which is specific to this package to decide which
  # character to render.
  _renderIcon: =>
    # if true
    "\u21ba"
    # else
    # ""

  # Determines whether at least one thread participant is external.
  _containsExternalDomain: (thread) =>
    
    console.log "Entered _containsExternalDomain"
    ###
    #  myDomains = {}
    #  otherDomains = {}

    #  thread.participants.forEach (p, i) ->
    #  (
    #    domain = p.email.toLowerCase().split("@")[1].trim()
    #    if (p.isMe())
    #      if not (domain in myDomains)
    #        myDomains[domain] = true

    #      else
    #        if not (domain in otherDomains)
    #          otherDomains[domain] = true
    #  )

    #  otherDomains = Object.keys(otherDomains)

    #  otherDomains.forEach (d, i) ->
    #  (
    #    if not (d in myDomains)
    #      return true
    #  )
    ###
    return false

module.exports = ExternalDomainWarning
