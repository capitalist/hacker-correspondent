module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Items.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ItemsMsg subMsg ->
            let
                ( updatedItems, updatedTopStories, cmd ) =
                    Items.Update.update subMsg model.items model.topStories
            in
                ( { model | items = updatedItems, topStories = updatedTopStories }, Cmd.map ItemsMsg cmd )
