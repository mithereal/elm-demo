module Structure exposing (..)

import Html exposing (Html,div,text)

import Html.App


--model

type alias Model =
    String

init : (Model,Cmd Msg)

init =
    ("placeholder text for structure example",Cmd.none)

--msg

type Msg
    = NoOp

   --view

view : Model -> Html Msg

view model =
    div []
        [ text model ]

       --update

update : Msg -> Model -> (Model, Cmd Msg)

update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

            --subs

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

    --main

main: Program Never

main =
    Html.App.program
        {init = init
        ,view = view
        ,update = update,
        subscriptions = subscriptions
        }