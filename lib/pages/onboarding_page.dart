import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  void _endIntroPage(context) {
    Navigator.pushReplacementNamed(context, '/list-restaurant');
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      globalBackgroundColor: Colors.white,
      animationDuration: 200,
      pages: [
        PageViewModel(
          title: "Makanan Bersih",
          body:
              "Makanan kamu terjamin kehalalan nya dan juga kebersihannya pun terjaga ",
          image: Image.asset(
            'assets/images/onboarding2.png',
          ),
        ),
        PageViewModel(
          title: "Pesan Makanan Mudah",
          body:
              "Pesan makanan mudah dan cepat melalui aplikasi",
          image: Image.asset(
            'assets/images/onboarding1.png',
          ),
        ),
        
        
      ],
      onDone: () => _endIntroPage(context),
      showNextButton: true,
      showSkipButton: true,
      showDoneButton: true,
      skip: const Text('Skip'),
      next: const Text('Next'),
      done: const Text('Done'),
      onSkip: () => _endIntroPage(context),
    );
  }
}
