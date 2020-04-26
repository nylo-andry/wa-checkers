import { Game, Position } from "game";
import { memory } from "game/game_bg";
import { Elm } from "./src/Main.elm";

const game = Game.new();
const boardPtr = game.board();
const board = new Uint8Array(memory.buffer, boardPtr, 64);

const app = Elm.Main.init({
	node: document.getElementById("elm-app"),
	flags: Array.from(board)
});

app.ports.movePiece.subscribe(function(data) {
	const from = Position.new(data.x1, data.y1);
	const to = Position.new(data.x2, data.y2);

	game.move_piece(from, to);
	const newBoard = new Uint8Array(memory.buffer, boardPtr, 64);
	
	 app.ports.updateBoard.send(Array.from(newBoard));
});
