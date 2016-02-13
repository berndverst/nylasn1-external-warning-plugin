# # External Domain Draft Warning
#
# Show a warning notification to indicate the current draft
# contains recipients from an external domain.

{Rx} = require 'nylas-exports'
{DatabaseStore, Draft, Message, React} = require 'nylas-exports'
{ObservableListDataSource,
 QueryResultSet,
 QuerySubscription} = require 'nylas-exports'

{Drafts} = require 'nylas-observables'
{RetinaImg} = require 'nylas-component-kit'
ExternalDomainStore = require './external-domain-store'

class ExternalDomainDraftWarning extends React.Component
  @displayName: 'ExternalDomainDraftWarning'

  constructor: (@props) ->
    @state =
      hasExternal: false

    console.log @props
    query = DatabaseStore.findAll(Message).where(
      [Message.attributes.id.in([@props.draftClientId])]
    )


    #query = DatabaseStore.find(Message, @props.draftClientId)
    console.log @query
    # Rx.Observable.from(query).subscribe (msg) =>
    #   console.log "" + msg
    # WHY: object is not iterable????

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
