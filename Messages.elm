module Messages exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.App

--Model

type alias Model =
    Bool

init : ( Model,Cmd Msg)

init =
    (False, Cmd.none)

-- messages

type Msg
    = Expand
    | Collapse

-- view

view : Model -> Html Msg

view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Collapse" ]
            , text "Widget"
            ]
            else
            div []
            [ button [ onClick Expand ] [text "Expand" ] ]

-- update

update : Msg -> Model -> ( Model, Cmd Msg )

update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            (False, Cmd.none )

-- subscriptions

subscriptions : Model -> Sub Msg

subscriptions model =
    Sub.none

-- main

main =
    Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }