import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.qr_code_scanner),
        onPressed: () async {
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          const barcodeScanRes = 'geo:15.33, 15.66';
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.nuevoScan(barcodeScanRes);
          // if (barcodeScanRes != '-1') {}
        });
  }
}
