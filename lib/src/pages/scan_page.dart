import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {

final String qrEscaneado;

ScanPage(this.qrEscaneado);

 @override
  _ScanPageState createState() => _ScanPageState(qrEscaneado);
}

class _ScanPageState extends State<ScanPage> {

final String qrEscaneado;

_ScanPageState(this.qrEscaneado);

@override
  void setState(fn) {
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Valor escaneado: $qrEscaneado"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_back),
        onPressed: (){         
          Navigator.pop(context);
        }
      )
    );
  }
}