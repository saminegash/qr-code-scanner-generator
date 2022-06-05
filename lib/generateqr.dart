import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://github.com";
  // ignore: prefer_final_fields
  late TextEditingController _qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: const Center(child: Text("Generate QR Code")),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          //Scroll view given to Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QrImage(data: qrData),
              const SizedBox(height: 20),
              const Text(
                "Generate QR Code",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                qrData,
                style: const TextStyle(fontSize: 20),
              ),

              //TextField for input link
              TextField(
                controller: _qrdataFeed,
                decoration:
                    // ignore: prefer_const_constructors
                    InputDecoration(hintText: "Enter your link here..."),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //Button for generating QR code
                child: ElevatedButton(
                  onPressed: () async {
                    //a little validation for the textfield

                    if (_qrdataFeed.text.isEmpty) {
                      setState(() {
                        qrData = "";
                      });
                    } else {
                      setState(() {
                        qrData = _qrdataFeed.text;
                      });
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.indigo),
                              borderRadius: BorderRadius.circular(20.0)))),

                  //Title given on Button

                  child: Text(
                    "Generate QR Code",
                    style: TextStyle(
                      color: Colors.indigo[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
