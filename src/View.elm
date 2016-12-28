module View exposing (..)

import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Items.List


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ h1 [] [ text "Hacker Correspondent" ] ]
        , (Html.map ItemsMsg (Items.List.view model.items model.topStories))
        ]
