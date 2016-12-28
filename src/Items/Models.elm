module Items.Models exposing (..)


type alias ItemId =
    Int


type alias Item =
    { id : ItemId
    , title :
        String
        -- , type_ : String
    , by :
        String
        -- , text : String
    , score :
        Int
        -- , parent : ItemId
        -- , parts : List ItemId
        -- , kids : List ItemId
        -- , descendants : List ItemId
    , time :
        Int
        -- , deleted : Bool
        -- , dead : Bool
    , url : String
    }
