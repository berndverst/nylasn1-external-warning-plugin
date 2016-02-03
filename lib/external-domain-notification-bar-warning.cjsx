# # External Domain Notification Bar Warning
#
# Show a warning notification bar to indicate whether the current thread
# contains recipients from an external domain.

{Utils, DraftStore, React} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'
ExternalDomainStore = require './external-domain-store'

class ExternalDomainNotificationBarWarning extends React.Component
  @displayName: 'ExternalDomainNotificationBarWarning'

  constructor: (@props) ->
    @state =
      hasExternal: ExternalDomainStore.containsExternalDomain(@props.thread)

  render: =>
    if @state.hasExternal
      <div className="external-warning-bar">
        <RetinaImg mode={RetinaImg.Mode.ContentIsMask}
          url="nylas://nylasn1-external-warning-plugin/assets/warning@2x.png"
          style={{backgroundColor: "red"}}/>
        This thread contains participants from external domains.
      </div>
    else
      null

module.exports = ExternalDomainNotificationBarWarning
