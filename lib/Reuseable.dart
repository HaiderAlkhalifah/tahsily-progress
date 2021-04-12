import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tahsily_progress/AppLocale.dart';
import 'Const.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//the progress Circul//

class Circul extends StatelessWidget {
  Circul({@required this.percentText});

  final int percentText;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200,
      lineWidth: 20.0,
      animation: true,
      animationDuration: 2000,
      percent: percentText.toDouble() / 100,
      center: new Text(
        "$percentText%",
        style: KBoldNumberStyle,
      ),
      backgroundColor: KMainCardColor,
      progressColor: KBluetColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

//the progress line//

class ProgressLine extends StatelessWidget {
  ProgressLine({@required this.tpercent});

  final int tpercent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 65,
        animation: true,
        lineHeight: 20.0,
        animationDuration: 2000,
        percent: (tpercent.toDouble() / 100).toDouble(),
        center: Text('$tpercent %'),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: KBluetColor,
        backgroundColor: KMainCardColor,
      ),
    );
  }
}

//the name of the subject above the progress line//

class SubName extends StatelessWidget {
  SubName({@required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name.toString(),
        style: KMainTextStyle,
      ),
    );
  }
}

//the progress details//

class ProDet extends StatelessWidget {
  ProDet(
      {@required this.lastPage,
      @required this.pagesRemain,
      @required this.style,
      @required this.totalPages});

  final String lastPage;
  final int pagesRemain;
  final TextStyle style;
  final String totalPages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        '$lastPage ' +
            getLang(context, 'out of') +
            '$totalPages' +
            getLang(context, 'pages, remained') +
            '$pagesRemain' +
            getLang(context, 'pages'),
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}

//Add progress icon//

class AddIcon extends StatelessWidget {
  AddIcon({this.onpress});

  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: Colors.white60,
        size: 34,
      ),
      onPressed: () {
        onpress();
      },
    );
  }
}

//Alert Style//
var alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: KAlertStyle,
  descTextAlign: TextAlign.start,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: BorderSide(
      color: KMainCardColor,
    ),
  ),
  titleStyle: TextStyle(
    color: KTextColor,
  ),
  alertAlignment: Alignment.center,
);

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, this.buttonTitle});
  final String buttonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KTitalStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 40),
        color: KBluetColor,
        width: double.infinity,
        height: 80,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
