module Component exposing (..)

import Html exposing ( Html )
import Html.App
import Widget

-- MODEL

type alias AppModel =
    { widgetModel : Widget.Model
    }

initalModel : AppModel

initalModel =
    { widgetModel = Widget.initialModel
    }

init : ( AppModel, Cmd Msg )

init =
    ( initalModel, Cmd.none )

-- MESSAGES

type Msg
    = WidgetMsg Widget.Msg


-- VIEW

view : AppModel -> Html Msg

view model =
    Html.div []
    [ Html.App.map WidgetMsg ( Widget.view model.widgetModel )
    ]

-- UPDATE

update : Msg -> AppModel -> ( AppModel, Cmd Msg )

update message model =
    case message of
        WidgetMsg subMsg ->
            let
                ( updateWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updateWidgetModel }, Cmd.map WidgetMsg widgetCmd )

-- SUBSCIPTIONS

subscriptions : AppModel -> Sub Msg

subscriptions model =
    Sub.none

-- APP

main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }