module Main exposing (..)

import Html exposing (program)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Items.Commands exposing (fetchTopStories)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.map ItemsMsg fetchTopStories )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
