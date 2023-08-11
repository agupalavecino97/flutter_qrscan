import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';

import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import '../widgets/custom_navigationbar.dart';
import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('Historial')),
        actions: [
          IconButton(icon: const Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectdMenuopt;
    // DBProvider.db.database;
    // final tempScan = ScanModel(valor: 'http://udemi.com');
    // DBProvider.db.nuevoScan(tempScan).then((scan) => print(scan));
    // DBProvider.db.getScans().then((scan) => print(scan));

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return const MapasPage();
      case 1:
        scanListProvider.cargarScansTipo('http');
        return const DireccionesPage();
      default:
        scanListProvider.cargarScansTipo('geo');
        return const MapasPage();
    }
  }
}
