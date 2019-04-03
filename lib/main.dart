import 'dart:async';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


void main() {
  runApp(GradientColorsApp());
}

List<Color> colorList = [Color(0xff84fab0), Color(0xff8fd3f4)];


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
    return Container(
          child: Column(
            children: <Widget>[
              ColorItem(index: 0),
              ColorItem(index: 1),
          ],
    ));
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
  ColorItem({this.index});
  final index;
  @override
  _ColorItemState createState() => _ColorItemState(index: index);
}

class _ColorItemState extends State<ColorItem> {
  _ColorItemState({this.index});
  final index;
  Color pickerColor = Color(0xff443a49);
  Color currentColor =  Color(0xff443a49);

  void changeColor(Color color) => setState(() => colorList[index] = color);
  void changeColorAndPopout(Color color) => setState(() {
        currentColor = color;
        colorList[index] = color;
        Timer(const Duration(milliseconds: 500),
            () => Navigator.of(context).pop());
      });

  Widget build(BuildContext context) {
    currentColor = colorList[index];
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
                            pickerColor: currentColor,
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
                color: currentColor,
              )),
            ),
            Text(currentColor.toString())
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
