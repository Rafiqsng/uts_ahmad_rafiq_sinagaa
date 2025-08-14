import 'package:flutter/material.dart';
import '../state/pesanan_state.dart';
import '../utils/format.dart';
import '../widgets/ringkasan_pesanan.dart';

class PesananPage extends StatelessWidget {
  final PesananState pesanan;
  const PesananPage({super.key, required this.pesanan});

  @override
  Widget build(BuildContext context) {
    if (pesanan.items.isEmpty) {
      return const Center(child: Text('Belum ada pesanan. Tambahkan dari menu.'));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: pesanan.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final item = pesanan.items[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(item.menu.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.menu.name, style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 4),
                            Text('Harga: ${rupiah(item.menu.price)}'),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => pesanan.decreaseMenu(item.menu),
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                SizedBox(
                                  width: 48,
                                  child: Text(item.qty.toString(), textAlign: TextAlign.center),
                                ),
                                IconButton(
                                  onPressed: () => pesanan.addMenu(item.menu),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                                const Spacer(),
                                Text('Total: ${rupiah(item.totalHargaItem)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        RingkasanPesanan(pesanan: pesanan),
      ],
    );
  }
}
