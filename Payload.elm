module Payload exposing (..)

import Html exposing ( Html, button, div, text )
import Html.Events exposing( onClick )
import Html.App

-- model

type alias Model =
    Int

init : ( Model, Cmd Msg )

init =
    ( 0, Cmd.none )

-- messages

type Msg
    = Increment Int

-- view

view : Model -> Html Msg

view model =
    div []
    [ button [ onClick (Increment 2) ] [ text "x" ]
    , text (toString model)
    ]

-- update

update : Msg -> Model -> ( Model, Cmd Msg )

update msg model =
    case msg of
        Increment howMuch ->
            ( model + howMuch, Cmd.none )

-- subscriptions

subscriptions : Model -> Sub Msg

subscriptions model =
    Sub.none

-- main

main : Program Never

main =
    Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }