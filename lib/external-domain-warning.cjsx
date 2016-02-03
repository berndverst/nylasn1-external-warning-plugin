# # External Domain Warning
#
# Show an icon for each thread to indicate whether it contains recipients
# from an external domain.

{Utils, DraftStore, React} = require 'nylas-exports'
{RetinaImg} = require 'nylas-component-kit'
ExternalDomainStore = require './external-domain-store'

class ExternalDomainWarning extends React.Component
  @displayName: 'ExternalDomainWarning'

  constructor: (@props) ->
    @state =
      hasExternal: ExternalDomainStore.containsExternalDomain(@props.thread)

  render: =>
    if @state.hasExternal
      <RetinaImg mode={RetinaImg.Mode.ContentIsMask}
        url="nylas://nylasn1-external-warning-plugin/assets/warning@2x.png"
        style={{backgroundColor: "red"}}/>
    else
      <RetinaImg mode={RetinaImg.Mode.ContentIsMask}
        url="nylas://nylasn1-external-warning-plugin/assets/warning@2x.png"/>

module.exports = ExternalDomainWarning
