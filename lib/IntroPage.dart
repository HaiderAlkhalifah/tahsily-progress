import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'Const.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage extends StatelessWidget {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  List<PageViewModel> introPages() {
    return [
      PageViewModel(
        title: "Welcome to our app",
        body: 'you are in the right place',
        image: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Image.asset(
              "lib/assets/images/Creativity-pana.png",
            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Welcome to our app",
        body: 'you are in the right place',
        image: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Image.asset(
              "lib/assets/images/Creativity-pana.png",
            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Are you ready to start?",
        bodyWidget: ElevatedButton(
          onPressed: () {
            // On button presed
          },
          child: Text("Let's Go!"),
        ),
        footer: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  style: KJTermsStyle,
                  text: "by using this application, you agree to our "),
              TextSpan(
                style: KTermsStyle,
                text: "Terms of Use",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    var url =
                        "https://github.com/HaiderAlkhalifah/Tahsily-Progress-/wiki/Terms-of-use";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
              ),
            ],
          ),
        ),
        image: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Image.asset(
              "lib/assets/images/Creativity-pana.png",
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          globalBackgroundColor: KBackgroundColor,
          pages: introPages(),
          onDone: () {},
          done: Text('')),
    );
  }
}
