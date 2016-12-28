module Models exposing (..)

import Items.Models exposing (Item, ItemId)
import Dict exposing (Dict)


type alias Model =
    { items : Dict Int Item
    , topStories : List ItemId
    }


initialModel : Model
initialModel =
    { items = Dict.empty
    , topStories = []
    }
