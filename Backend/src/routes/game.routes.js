const express = require('express');
const router = express.Router();
const gameController = require('../controllers/game.controller');

// Get all games
router.get('/', gameController.getAllGames);

// Get a game by ID
router.get('/:id', gameController.getGame);

// Create a new game
router.post('/', gameController.createGame);

// Update a game by ID
router.put('/:id', gameController.updateGame);

// Delete a game by ID
router.delete('/:id', gameController.deleteGame);

module.exports = router;