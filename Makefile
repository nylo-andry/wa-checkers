build-game: packages/game/Cargo.toml
	cd packages/game && \
		wasm-pack build

build-web: build-game
		cd packages/web && \
		npm run build

start-web: build-game
	cd packages/web && \
	npm install && \
	npm start
