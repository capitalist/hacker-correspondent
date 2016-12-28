module Items.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (list, string, int, bool)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import Items.Models exposing (ItemId, Item)
import Items.Messages exposing (..)


fetchTopStories : Cmd Msg
fetchTopStories =
    Http.get fetchTopStoriesUrl (list int)
        |> Http.send OnTopStories


fetchTopStoriesUrl : String
fetchTopStoriesUrl =
    "https://hacker-news.firebaseio.com/v0/topstories.json"


fetchItem : ItemId -> Cmd Msg
fetchItem id =
    Http.get (fetchItemUrl id) decodeItem
        |> Http.send OnItem


fetchItemUrl : ItemId -> String
fetchItemUrl id =
    "https://hacker-news.firebaseio.com/v0/item/" ++ (toString id) ++ ".json"


decodeItem : Decode.Decoder Item
decodeItem =
    decode Item
        |> required "id" int
        |> required "title" string
        -- |> required "type" string
        |>
            required "by" string
        -- |> required "text" string
        |>
            required "score" int
        |> optional "time" int 0
        |> optional "url" string ""



-- |> optional "parent" int 0
-- |> optional "parts" (list int) []
-- |> optional "kids" (list int) []
-- |> optional "descendants" (list int) []
-- |> optional "deleted" bool False
-- |> optional "dead" bool False
