import 'package:flutter/material.dart';
import '../models/menu.dart';
import '../models/pesanan_item.dart';

class PesananState extends ChangeNotifier {
  final List<PesananItem> _items = [];

  List<PesananItem> get items => List.unmodifiable(_items);

  void addMenu(Menu menu) {
    final idx = _items.indexWhere((e) => e.menu.id == menu.id);
    if (idx == -1) {
      _items.add(PesananItem(menu: menu, qty: 1));
    } else {
      _items[idx].qty += 1;
    }
    notifyListeners();
  }

  void decreaseMenu(Menu menu) {
    final idx = _items.indexWhere((e) => e.menu.id == menu.id);
    if (idx == -1) return;
    if (_items[idx].qty > 1) {
      _items[idx].qty -= 1;
    } else {
      _items.removeAt(idx);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int get totalJumlahMenu => _items.fold(0, (sum, e) => sum + e.qty);
  int get totalJumlahPesanan => _items.length;
  int get totalHargaPesanan => _items.fold(0, (sum, e) => sum + e.totalHargaItem);
}
