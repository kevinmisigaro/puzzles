import 'package:flutter/material.dart';
import 'package:payment_app/views/payment_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({ Key? key }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _qrInfo = '';
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera(); 
      _qrCallback(scanData.code.toString());
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  _qrCallback(String code) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentPage()));
  }

  checkCode(code) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verifying')));
    _qrCallback(code);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar: AppBar(backgroundColor: Colors.white, elevation: 0, automaticallyImplyLeading: false,
        title: Text('Qr Scanner', style: TextStyle(fontFamily: 'Euclid Circular B',
        fontSize: 32.0, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, ),),
        toolbarHeight: height * .08,
      ),
      body: Stack(children: [
        Container(child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max,
            children: [
              Container(height: height * .82, width: width, child: Padding(
                padding: const EdgeInsets.all(8.0), 
                child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).primaryColor, borderRadius: 10, borderLength: 30,
                    borderWidth: 10, cutOutSize: MediaQuery.of(context).size.width - 30),
                  onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p)
                ),
              ),),
            ],
          ),
        )),
      ],
      ),
    );
  }
}