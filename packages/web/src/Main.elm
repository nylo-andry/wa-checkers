port module Main exposing (..)

import Browser
import Html exposing (Html, div, table, tr, td, text)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)
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



-- PORTS


port movePiece : MoveCommand -> Cmd msg


port updateBoard : (List Int -> msg) -> Sub msg



-- MODEL


type alias MoveCommand =
    { x1 : Int
    , y1 : Int
    , x2 : Int
    , y2 : Int
    }


type alias Model =
    { board : List Int
    , selection : Selection
    }


type Selection
    = None
    | Piece Int Int


init : List Int -> ( Model, Cmd Msg )
init initialBoard =
    ( { board = initialBoard
      , selection = None
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = HandleClick Int Int
    | UpdateBoard (List Int)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleClick x y ->
            case model.selection of
                None ->
                    ( { model | selection = (Piece x y) }, Cmd.none )

                Piece x1 y1 ->
                    ( { model | selection = None }, movePiece { x1 = x1, y1 = y1, x2 = x, y2 = y } )

        UpdateBoard board ->
            ( { model | board = board }, Cmd.none )



-- VIEW


boardRow : Int -> List Int -> Html Msg
boardRow x cells =
    tr []
        (List.indexedMap
            (\y cell ->
                td []
                    [ div
                        [ classList
                            [ ( "cell", True )
                            , ( "piece", not (cell == 0) )
                            , ( "red", cell == 1 )
                            , ( "black", cell == 2 )
                            ]
                        , onClick (HandleClick x y)
                        ]
                        []
                    ]
            )
            cells
        )


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text
                (case model.selection of
                    None ->
                        ""

                    Piece x y ->
                        String.append (String.fromInt x) (String.fromInt y)
                )
            ]
        , table
            []
            (List.indexedMap boardRow (chunksOfLeft 8 model.board))
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    updateBoard UpdateBoard
