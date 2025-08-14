import 'package:flutter/material.dart';
import '../models/menu.dart';
import '../state/pesanan_state.dart';
import '../utils/format.dart';

const _menus = <Menu>[
  Menu(id: 'm1', name: 'Nasi Goreng Spesial', imageUrl: 'https://images.unsplash.com/photo-1645177628172-a94c1f96e6db?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bmFzaSUyMGdvcmVuZyUyMHNwZWNpYWx8ZW58MHx8MHx8fDA%3D', price: 22000),
  Menu(id: 'm2', name: 'Mie Ayam Bakso', imageUrl: 'https://images.unsplash.com/photo-1680675706515-fb3eb73116d4?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWllJTIwYXlhbXxlbnwwfHwwfHx8MA%3D%3D', price: 18000),
  Menu(id: 'm3', name: 'Ayam Geprek', imageUrl: 'https://images.unsplash.com/photo-1696340034876-6245523babfa?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXlhbSUyMGdlcHJla3xlbnwwfHwwfHx8MA%3D%3D', price: 20000),
  Menu(id: 'm4', name: 'Es Teh Manis', imageUrl: 'https://media.istockphoto.com/id/1429492045/photo/hot-tea.webp?a=1&b=1&s=612x612&w=0&k=20&c=8KCS2S9Bi9yg9oraZj3L7RnXwAZUb4MAiqBrt0I_djw=', price: 5000),
];

class MenuPage extends StatelessWidget {
  final PesananState pesanan;
  const MenuPage({super.key, required this.pesanan});

  @override   
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: _menus.length,
      itemBuilder: (context, i) {
        final m = _menus[i];
        return Card(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Ink.image(
                  image: NetworkImage(m.imageUrl),
                  fit: BoxFit.cover,
                  child: InkWell(onTap: () {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.name, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(rupiah(m.price), style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => pesanan.addMenu(m),
                            icon: const Icon(Icons.add_shopping_cart),
                            label: const Text('Tambah'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
