import 'package:flutter/material.dart';
import '../state/pesanan_state.dart';
import '../utils/format.dart';

class RingkasanPesanan extends StatelessWidget {
  final PesananState pesanan;
  const RingkasanPesanan({super.key, required this.pesanan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 24,
            runSpacing: 8,
            children: [
              _chip('Total jumlah menu', pesanan.totalJumlahMenu.toString()),
              _chip('Total jumlah pesanan', pesanan.totalJumlahPesanan.toString()),
              _chip('Total harga pesanan', rupiah(pesanan.totalHargaPesanan)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: pesanan.items.isEmpty ? null : pesanan.clear,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Hapus Pesanan'),
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed: pesanan.items.isEmpty ? null : () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Konfirmasi'),
                      content: Text('Total yang harus dibayar: ${rupiah(pesanan.totalHargaPesanan)}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Tutup'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Buat Pesanan'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String value) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$label: '),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
