import { Game } from "game";
import { memory } from "game/game_bg";
import { Elm } from "./src/Main.elm";

const game = Game.new();
const boardPtr = game.board();
const board = new Uint8Array(memory.buffer, boardPtr, 64);

const app = Elm.Main.init({
	node: document.getElementById("elm-app"),
	flags: Array.from(board)
});
