import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_cupertino_widget/adaptative_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final platform = Theme.of(context).platform;
    final platform = TargetPlatform.iOS;
    bool isOS = (platform == TargetPlatform.iOS); // Changer le double == en != pour passer de android a iOS et vice versa
    return isOS ? iOSBase(platform: platform) : androidBase(platform: platform);
  }

  CupertinoApp iOSBase({required TargetPlatform platform}) {

    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.black
      ),
      title: 'Lean Cupertino',
      home: AdaptativePage(platform: platform,),

    );
  }


  MaterialApp androidBase({required TargetPlatform platform}) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title:'Learn Cupertino',
      home: AdaptativePage(platform: platform,),
    );
  }
}
