import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativePage extends StatefulWidget {

  final TargetPlatform platform;

  AdaptativePage({required this.platform});

  @override
  AdaptativePageState createState() => AdaptativePageState();
}

class AdaptativePageState extends State<AdaptativePage> {
  bool loveFlutter = true;
  bool switchValue = true;
  double minValue = 0;
  double maxValue = 100;
  double currentValue = 25;
  String text = "";
  int groupValue = 0;

  List<Text> animals = [
    Text('Hibou'),
    Text('Chat'),
    Text('Hérisson'),
    Text('Doggo'),
    Text('Scorpion'),
  ];

  @override
  Widget build(BuildContext context) {

    return scaffold();

  }

  bool isiOS() =>(widget.platform == TargetPlatform.iOS);

  Widget scaffold()  {
    return(isiOS())
        ? CupertinoPageScaffold(navigationBar: navBar() ,child: body())
        : Scaffold(appBar: appBar(), body: body());
  }

  AppBar appBar() {
    return AppBar(title: Text("Notre design sous Android"));
  }

  CupertinoNavigationBar navBar()  {
    return  CupertinoNavigationBar(middle: Text("Notre design sous iOS"), backgroundColor: Colors.white);
  }

  Widget body() {
    return Column(
      children: [
        button(),
        Divider(),
        switchRow(),
        Divider(),
        sliderColumn(),
        Divider(),
        textFields(),
        Text(text),
        fab(),
        picker(),

      ],
    );
  }

  Widget button() {
    return (isiOS())
        ? CupertinoButton(child: textButton(), onPressed: onButtonPressed,color: Colors.black,)
        :  ElevatedButton(onPressed: onButtonPressed, child: textButton());
  }
  
  Text textButton() {
    return Text((loveFlutter)? "I love Flutter" : "php is my favorite");
  }

  void onButtonPressed(){
    setState(() {
      loveFlutter  = !loveFlutter;
    });
  }

  Row switchRow() => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(switchValue ? "Je suis vrai" : "Je suis faux"),
      switchAdaptative()
    ],
  );


  Widget switchAdaptative() {
    return (isiOS())
        ? CupertinoSwitch(value: switchValue, onChanged: onSwitchChanged)
        : Switch(value: switchValue, onChanged: onSwitchChanged);
}
    void onSwitchChanged(bool newValue) => setState(() => switchValue = newValue);

  Widget slider() {
    return (isiOS())
        ? CupertinoSlider(value: currentValue, onChanged: onSliderChanged, min: minValue, max: maxValue)
        : Slider(value: currentValue, onChanged: onSliderChanged, min: minValue, max: maxValue);
  }
  onSliderChanged(double newValue) {
    setState(() {
      currentValue = newValue;
    });
  }
  Column sliderColumn() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Min:${minValue.toInt().toString()}"),
            Text("Max:${minValue.toInt().toString()}")
          ],
        ),
        slider(),
        Text(currentValue.toInt().toString())
      ],
    );
  }

  Widget textFields() {
    return(isiOS())
        ? CupertinoTextField(onSubmitted: submittedText,placeholder: "Entrez quelque chose",)
        : TextField(onSubmitted: submittedText, decoration: InputDecoration(hintText: "Entrez quelque chose"),);
  }
  submittedText(String newValue) {
    setState(() {
      text = newValue;
    });
  }

  Widget actionSheet() {
    return CupertinoActionSheet(
          title: Text("Notre ActionSheet"),
          message: Text("Notre message"),
          actions: [
            CupertinoDialogAction(child: Text("Oui"),  onPressed: close,),
            CupertinoDialogAction(child: Text("Non"), onPressed: close),
            CupertinoDialogAction(child: Text("Peut-être") , onPressed: close),
          ],
         );

  }
  
  FloatingActionButton fab() {
    return FloatingActionButton(
      child: Icon(Icons.apartment),
        onPressed: () {
      if (isiOS()) {
        showDialog(context: context, builder: (BuildContext ctx) {
          return actionSheet();
        });
      }
    });
  }
  void close() {
    Navigator.of(context).pop();
  }

  Widget picker() {

    return(!isiOS())
        ? Container()
        : Column(
      children: [
        CupertinoPicker(
        itemExtent: 50,
        onSelectedItemChanged: (int index) {
          setState(() {
            print("Mon index est :$index");
          });
        },
        diameterRatio: 0.2,
        backgroundColor: Colors.redAccent.shade100,
        children: animals
        ),
        CupertinoSegmentedControl(
          groupValue: groupValue,
            children: m(),
            onValueChanged: (int  index){

            }
            ),
        CupertinoSlidingSegmentedControl(
          groupValue: groupValue,
            children: m(),
            onValueChanged: (int? index) {
            setState(() {
              groupValue = index ?? 0;
            });
            })
      ],
     );
  }
  Map <int, Widget> m () {
    Map<int, Widget> newMap = {};
    for (var x = 0; x < animals.length;  x++) {
      newMap[x] = animals[x];
    }
    return newMap;
  }
}
