import 'dart:async';


import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


void main() {
  runApp(GradientColorsApp());
}

List<ColorModel> colorModelList = [ColorModel(Color(0xff84fab0)), ColorModel(Color(0xff84fab0))];
List<Color> colorList = List();
List<Widget> colorItemList = List();

class GradientColorsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gradient Colors',
      theme: ThemeData.dark(),
      home: BackdropScaffold(
        title: Text("Gradient Colors"),
        backpanel: OptionsRoute(),
        body: GradientViewRoute(),
      ),
    );
  }
}

class OptionsRoute extends StatefulWidget {
  const OptionsRoute();

  @override
  _OptionsRouteState createState() => _OptionsRouteState();
}

class _OptionsRouteState extends State<OptionsRoute> {
  @override
  Widget build(BuildContext context) {
    colorModelList.forEach((f) => colorItemList.add(ColorItem(colorModel: f)));

    return Container(
      child: Column(
       children: <Widget>[Column(
          children: colorItemList
        ),
       FlatButton.icon(
           onPressed: () =>
               colorModelList.add(ColorModel(Color(0xff443a49))),
           icon: Icon(Icons.add),
           label: Text("Add a new color")
       )
       ]
      )
    );
  }
}

class GradientViewRoute extends StatefulWidget {
  const GradientViewRoute();

  @override
  _GradientViewRouteState createState() => _GradientViewRouteState();
}

class _GradientViewRouteState extends State<GradientViewRoute> {
  @override
  Widget build(BuildContext context) {
    colorModelList.forEach((f) => colorList.add(f.mColor));

    return Center(
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          gradient: new LinearGradient(
              colors: colorList,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
      ),
    );
  }
}

class ColorItem extends StatefulWidget {
  ColorItem({this.colorModel});
  final colorModel;
  @override
  _ColorItemState createState() => _ColorItemState(colorModel: colorModel);
}

class _ColorItemState extends State<ColorItem> {
  _ColorItemState({this.colorModel});
  final ColorModel colorModel;
  Color pickerColor = Color(0xff443a49);

  void changeColor(Color color) => setState(() => colorModel.mColor = color);
  void changeColorAndPopout(Color color) => setState(() {
        colorModel.mColor = color;
        Timer(const Duration(milliseconds: 500),
            () => Navigator.of(context).pop());
      });

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              child: Center(
                  child: RaisedButton(
                  elevation: 3.0,
                  onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(0.0),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: colorModel.mColor,
                            onColorChanged: changeColor,
                            colorPickerWidth: 1000.0,
                            pickerAreaHeightPercent: 0.7,
                            enableAlpha: false,
                          ),
                        ),
                      );
                    },
                  );
                },
                color: colorModel.mColor,
              )),
            ),
            Text(colorModel.mColor.toString())
          ],
        ),
      ),
      height: 64,
      margin: EdgeInsets.all(8),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeData.dark().cardColor),
    );
  }
}
class ColorModel{
  Color mColor;
  ColorModel(Color color){
    mColor = color;
  }
}