// @dart=2.9
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: const Text("Flutter Dialer"),
          centerTitle: true,
        ),
        body: const PhoneCall(),
      ),
    );
  }
}

class PhoneCall extends StatefulWidget {
  const PhoneCall({key}) : super(key: key);

  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validate() {
    if (!_formKey.currentState.validate()) {
      // Process data.
    }
  }
  /*_makingPhoneCall(String ph) async {
    String callno = ph;
    String url = 'tel:' + callno;
    if (await canLaunch(url)) {
      await launch(url);2
    } else {
      throw 'Could not launch $url';
    }
  }*/

  String mobile;
  TextEditingController c1;
  @override
  void initState() {
    super.initState();
    c1 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              maxLength: 10,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone_android_sharp),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter number';
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              controller: c1,
            ),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5.0,
            splashColor: Colors.white,
            onPressed: () {
              // _makingPhoneCall(c1.text);

              FlutterPhoneDirectCaller.callNumber(
                  c1.text); //............... jumps direct to call.
            },
            color: Colors.blue,
            child: const Text(
              "Place Call",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
