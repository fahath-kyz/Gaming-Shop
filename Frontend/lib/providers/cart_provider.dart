import 'package:flutter/foundation.dart';
import '../models/game.dart';

class CartItem {
  final Game game;
  int quantity;

  CartItem({required this.game, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  Map<String?, CartItem> _items = {};

  Map<String?, CartItem> get items => {..._items};
  int get itemCount => _items.length;
  
  double get totalAmount {
    return _items.values.fold(0.0, 
      (sum, item) => sum + (item.game.price * item.quantity));
  }

  void addItem(Game game) {
    if (_items.containsKey(game.id)) {
      _items.update(game.id,
        (existing) => CartItem(
          game: existing.game,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(game.id, () => CartItem(game: game));
    }
    notifyListeners();
  }

  void removeItem(String? gameId) {
    _items.remove(gameId);
    notifyListeners();
  }

  void decreaseQuantity(String? gameId) {
    if (!_items.containsKey(gameId)) return;
    if (_items[gameId]!.quantity > 1) {
      _items.update(
        gameId,
        (existing) => CartItem(
          game: existing.game,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _items.remove(gameId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}