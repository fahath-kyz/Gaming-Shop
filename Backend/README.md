# Gaming Product Manager Backend

This is the backend for the Gaming Product Manager application, built using Node.js and Express. It provides a RESTful API for managing a curated list of video games.

## Features

- **CRUD Operations**: Create, Read, Update, and Delete game entries.
- **MongoDB Integration**: Stores game data in a MongoDB database.
- **RESTful API**: Provides endpoints for interacting with game data.

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the backend directory:
   ```
   cd gaming-product-manager/backend
   ```

3. Install dependencies:
   ```
   npm install
   ```

4. Set up your MongoDB connection in `src/config/db.config.js`.

## Usage

To start the server, run:
```
node src/app.js
```

The server will run on `http://localhost:3000` by default.

## API Endpoints

- `GET /api/games`: Retrieve all games.
- `GET /api/games/:id`: Retrieve a game by ID.
- `POST /api/games`: Create a new game.
- `PUT /api/games/:id`: Update an existing game.
- `DELETE /api/games/:id`: Delete a game.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.