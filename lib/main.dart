import 'package:flutter/material.dart';
import 'state/pesanan_state.dart';
import 'pages/menu_page.dart';
import 'pages/pesanan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PesananState pesanan = PesananState();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uts_ahmad rafiq sinaga',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 105, 150, 0)),
        useMaterial3: true,
      ),
      home: AnimatedBuilder(
        animation: pesanan,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Rumah makan rafiq'),
              actions: [
                Badge(
                  isLabelVisible: pesanan.totalJumlahMenu > 0,
                  label: Text(pesanan.totalJumlahMenu.toString()),
                  child: IconButton(
                    tooltip: 'Lihat Pesanan',
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () => setState(() => currentIndex = 1),
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: currentIndex,
              children: [
                MenuPage(pesanan: pesanan),
                PesananPage(pesanan: pesanan),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (i) => setState(() => currentIndex = i),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.restaurant_menu), label: 'Menu'),
                NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Pesanan'),
              ],
            ),
          );
        },
      ),
    );
  }
}
