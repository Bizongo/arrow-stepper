import 'package:arrow_stepper/arrow_stepper.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Progress Stepper Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Progress Stepper'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementStepper() {
    setState(() {
      _counter++;
    });
  }
  int _selectedStep = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ArrowWithStepper(
                width: double.infinity,
                height: 25,
                stepCount: 10,
                builder: (index) {
                  double widthOfStep = 200 / 3;
                  if (index == 1) {
                    return ProgressStepWithArrow(
                      width: widthOfStep,
                      defaultColor: Colors.white,
                      progressColor: Colors.green,
                      wasCompleted: _selectedStep >= index,
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'DIams iddk',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return ProgressStepWithChevron(
                    width: widthOfStep,
                    defaultColor: Colors.white,
                    progressColor: Colors.green,
                    wasCompleted: _selectedStep >= index,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'DIams iddk',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementStepper,
          tooltip: 'Increment Stepper',
          child: Icon(Icons.plus_one),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
