import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';

// You can use a relative import, i.e. `import 'category_route.dart;'` or
// a package import.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html

/// The function that is called when main.dart is run.
void main() {
  runApp(GradientColorsApp());
}
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
class _OptionsRouteState extends State<OptionsRoute>{
  @override
  Widget build(BuildContext context) {
    return Center(
    child: Container(
        child: Column(
        children: <Widget>[
          Text("hola"),
          Text("hola"),
          Text("hola"),
        ],
        )
      )
    );
  }
}
class GradientViewRoute extends StatefulWidget {
  const GradientViewRoute();

  @override
  _GradientViewRouteState createState() => _GradientViewRouteState();
}
class _GradientViewRouteState extends State<GradientViewRoute>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: Colors.purple,
          gradient: new LinearGradient(
              colors: [Colors.red, Colors.cyan],
              begin: Alignment.centerRight,
              end: new Alignment(-1.0, -1.0)
          ),
        ),
      ),
    );
  }
}
