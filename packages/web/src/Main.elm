port module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- PORTS


port add : AddCommand -> Cmd msg


port addResult : (Int -> msg) -> Sub msg



-- MODEL


type alias Model =
    { total : Int
    , firstAddend : Int
    , secondAddend : Int
    }


type alias AddCommand =
    { first : Int
    , second : Int
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { total = 0
      , firstAddend = 0
      , secondAddend = 0
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = UpdateFirstAddend String
    | UpdateSecondAddend String
    | Add
    | AddResult Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateFirstAddend val ->
            case String.toInt val of
                Nothing ->
                    ( model, Cmd.none )

                Just i ->
                    ( { model | firstAddend = i }
                    , Cmd.none
                    )

        UpdateSecondAddend val ->
            case String.toInt val of
                Nothing ->
                    ( model, Cmd.none )

                Just i ->
                    ( { model | secondAddend = i }
                    , Cmd.none
                    )

        Add ->
            ( model
            , add { first = model.firstAddend, second = model.secondAddend }
            )

        AddResult total ->
            ( { model | total = total }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    addResult AddResult



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ value (String.fromInt model.firstAddend), onInput UpdateFirstAddend ] []
        , div [] [ text "+" ]
        , input [ value (String.fromInt model.secondAddend), onInput UpdateSecondAddend ] []
        , button [ onClick Add ] [ text "=" ]
        , div [] [ text (String.fromInt model.total) ]
        ]
