use wasm_bindgen::prelude::*;

#[wasm_bindgen]
#[repr(u8)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Piece {
    Empty = 0,
    Red = 1,
    Black = 2,
}

#[wasm_bindgen]
pub struct Game {
    board: Vec<Piece>,
}

#[wasm_bindgen]
impl Game {
    pub fn new() -> Game {
        let board = vec![
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Red,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
            Piece::Black,
            Piece::Empty,
        ];

        Game { board }
    }

    pub fn board(&self) -> *const Piece {
        self.board.as_ptr()
    }
}
