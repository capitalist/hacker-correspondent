module Items.Messages exposing (..)

import Http
import Items.Models exposing (ItemId, Item)


type Msg
    = OnTopStories (Result Http.Error (List ItemId))
    | OnItem (Result Http.Error Item)
