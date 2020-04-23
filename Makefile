build-game: packages/game/Cargo.toml
	cd packages/game && \
		wasm-pack build --target web

build-web:
		cd packages/web && \
		elm make src/Main.elm --output dist/elm.js

start-web: build-game build-web
		docker build -t wa-checkers . && \
		docker run --rm --name wa-checkers -p 3000:80 wa-checkers
