use std::convert::TryFrom;
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
pub struct Position {
    x: i8,
    y: i8,
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

    pub fn move_piece(&mut self, from: Position, to: Position) -> *const Piece {
        let from_pos = usize::try_from((from.x * 8) + from.y).unwrap();
        let to_pos = usize::try_from((to.x * 8) + to.y).unwrap();
        let piece = self.board[from_pos];

        self.board[to_pos] = piece;
        self.board[from_pos] = Piece::Empty;

        self.board.as_ptr()
    }
}

#[wasm_bindgen]
impl Position {
    pub fn new(x: i8, y: i8) -> Position {
        Position { x, y }
    }
}
