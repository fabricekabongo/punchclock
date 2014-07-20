### IMPORTS ###
{View} = require 'atom'

### EXPORTS ###
module.exports =
    class StatusView extends View
        ### CONSTRUCTOR ###

        ### CONTENT ###
        @content: ->
            # Setup the container
            @div class: 'timekeeper timer inline-block', =>
                # Status
                @span outlet: "status", id: "status"

        ### INITIALIZE ###
        initialize: ->

        ### SERIALIZE ###
        serialize: ->

        ### ATTACH ###
        attach: ->
            # Check if we have the status bar
            if atom.workspaceView.statusBar
                # Attach the timer view to the status bar if available
                atom.workspaceView.statusBar.prependRight( this )
            else
                # Attach it directly to the workspace view
                # TODO - Fix this (this is a work around for testing)
                atom.workspaceView.appendToTop( this )

        ### DESTROY ###
        destroy: ->
            # Detach at this point
            @detach()

        ### UPDATE ###
        update: ( value ) ->
            # Update the status with the message
            @status.text( value )

        ### CLEAR ###
        clear: ->
            # Clear any status message
            @status.text( "" )