module Items.Update exposing (..)

import Items.Messages exposing (Msg(..))
import Items.Models exposing (Item, ItemId)
import Items.Commands exposing (fetchItem)
import Dict exposing (Dict)


update : Msg -> Dict Int Item -> List ItemId -> ( Dict Int Item, List ItemId, Cmd Msg )
update message items topStories =
    case message of
        OnTopStories (Ok newItemsIds) ->
            ( items
            , (List.take itemLimit newItemsIds)
            , Cmd.batch (itemFetches (List.take itemLimit newItemsIds))
            )

        OnTopStories (Err error) ->
            ( items, topStories, Cmd.none )

        OnItem (Ok item) ->
            ( (updateItemInItems item items)
            , topStories
            , Cmd.none
            )

        OnItem (Err error) ->
            ( items, topStories, Cmd.none )


itemLimit : Int
itemLimit =
    2


itemFetches : List ItemId -> List (Cmd Msg)
itemFetches =
    List.map idToFetch


idToFetch : ItemId -> Cmd Msg
idToFetch id =
    fetchItem id


updateItemInItems : Item -> Dict Int Item -> Dict Int Item
updateItemInItems item items =
    Dict.insert item.id item items
