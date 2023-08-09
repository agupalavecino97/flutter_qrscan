import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
          final barcodeScanRes = 'fenando-herrera.com';
          if (barcodeScanRes != '-1') {}
        });
  }
}
