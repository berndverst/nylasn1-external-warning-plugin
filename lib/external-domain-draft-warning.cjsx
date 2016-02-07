# # External Domain Draft Warning
#
# Show a warning notification to indicate the current draft
# contains recipients from an external domain.

{Rx} = require 'rx-lite'
{React} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'
ExternalDomainStore = require './external-domain-store'

class ExternalDomainDraftWarning extends React.Component
  @displayName: 'ExternalDomainDraftWarning'

  constructor: (@props) ->
    @state =
      hasExternal: false
    #TODO(berndverst): Check draft recipients and show warning
    #                  Update warning every time recipients are altered.
    # @state =
    #   hasExternal: ExternalDomainStore.containsExternalDomain(@props.draft)

  render: =>
    if @state.hasExternal
      <div className="external-warning-bar">
        <RetinaImg mode={RetinaImg.Mode.ContentIsMask}
          url="nylas://nylasn1-external-warning-plugin/assets/warning@2x.png"
          style={{backgroundColor: "red"}}/>
        This message will be sent to external domains.
      </div>
    else
      null

module.exports = ExternalDomainDraftWarning
