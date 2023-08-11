import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.qr_code_scanner),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          // const barcodeScanRes = 'http://facebock.com';
          // const barcodeScanRes = 'geo:-27.784433,-64.261006';

          if (barcodeScanRes == '-1') {
            return;
          }
          final scanListProvider =
              // ignore: use_build_context_synchronously
              Provider.of<ScanListProvider>(context, listen: false);
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          // ignore: use_build_context_synchronously
          launchInBrowser(context, nuevoScan);
          // if (barcodeScanRes != '-1') {}
        });
  }
}
