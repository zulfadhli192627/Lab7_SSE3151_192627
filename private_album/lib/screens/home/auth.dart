import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:private_album/screens/home/dashboard.dart';
import 'package:pinput/pin_put/pin_put.dart';

class AuthScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Authentication",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Pin Sign in
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: PinPut(
                  fieldsCount: 6,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.deepPurpleAccent.withOpacity(.5),
                    ),
                  ),
                ),
              ),

              // Ora text
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  'Or',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              // Touch Login Button
              FlatButton(
                child: Text(
                  'Sign in with Fingerprint',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                onPressed: () async {
                  bool checkBio = await localAuth.canCheckBiometrics;
                  if (checkBio) {
                    bool authenticated =
                        await localAuth.authenticateWithBiometrics(
                            localizedReason: 'Authenticate to go to Dashboard');

                    if (authenticated) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
