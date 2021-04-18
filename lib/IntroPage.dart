import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'Const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SettingsBrain.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          globalBackgroundColor: KBackgroundColor,
          pages: [
            PageViewModel(
              title: "Welcome to our app",
              body: 'you are in the right place',
              image: Padding(
                padding: const EdgeInsets.all(60),
                child: Center(
                  child: Image.asset(
                    "lib/assets/images/Welcome-amico.png",
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: "Are you ready to start?",
              bodyWidget: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 160, height: 50),
                  child: ElevatedButton(
                    child: Text(
                      "Let's Go!",
                      style: KLetsGo,
                    ),
                    onPressed: () {
                      StartUpPref().hasGone = true;
                      Navigator.pop(context);
                    },
                  ),
                ),
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
          ],
          onDone: () {},
          done: Text('')),
    );
  }
}
