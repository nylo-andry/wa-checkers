module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, div, table, tr, td, text)
import Html.Attributes exposing (classList)
import List exposing (map)
import List.Split exposing (chunksOfLeft)


-- MAIN


main : Program (List Int) Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { board : List Int }


init : List Int -> ( Model, Cmd Msg )
init initialBoard =
    ( { board = initialBoard }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


boardRow : List Int -> Html Msg
boardRow row =
    tr []
        (List.map
            (\x ->
                td []
                    [ div
                        [ classList
                            [ ( "piece", True )
                            , ( "red", x == 1 )
                            , ( "black", x == 2 )
                            ]
                        ]
                        []
                    ]
            )
            row
        )


view : Model -> Html Msg
view model =
    table []
        (List.map boardRow (chunksOfLeft 8 model.board))



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
