module Items.List exposing (..)

import Html exposing (Html, text, div, span, h1, h2, h3, ul, li)
import Html.Attributes exposing (class)
import Items.Messages exposing (..)
import Items.Models exposing (ItemId, Item)
import Dict exposing (Dict)


view : Dict Int Item -> List ItemId -> Html Msg
view items topStories =
    div [ class "foo" ]
        [ list items topStories ]


list : Dict Int Item -> List ItemId -> Html Msg
list items topStories =
    ul []
        (List.map itemRow (List.map (itemLookup items) topStories))


itemRow : Item -> Html Msg
itemRow item =
    li []
        [ h3 [] [ text item.title ]
        , div [ class "score" ] [ text (toString item.score) ]
        , div [ class "by" ] [ text item.by ]
        , div [ class "when" ] [ text (toString item.time) ]
        , div [ class "where" ] [ text item.url ]
        ]


itemLookup : Dict Int Item -> ItemId -> Item
itemLookup items id =
    case (Dict.get id items) of
        Nothing ->
            { id = id
            , title =
                "not loaded"
                -- , type_ = "null"
            , by =
                "nobody"
                -- , text = "nothing"
            , score =
                0
                -- , parent = 0
                -- , parts = []
                -- , kids = []
                -- , descendants = []
            , time =
                0
                -- , deleted = False
                -- , dead = False
            , url =
                ""
                -- , deleted = False
            }

        Just item ->
            item
