import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'signin_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: scale.getFullScreen(25),
              ),
              SizedBox(height: scale.getHeight(1)),
              SignButtons(),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
