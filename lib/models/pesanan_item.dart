import 'menu.dart';

class PesananItem {
  final Menu menu;
  int qty;

  PesananItem({required this.menu, this.qty = 1});

  int get totalHargaItem => menu.price * qty;
}
