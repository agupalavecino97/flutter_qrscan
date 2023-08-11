import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

Future<void> launchInBrowser(
  BuildContext context,
  ScanModel scan,
) async {
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, '/mapa', arguments: scan);
  }
}
