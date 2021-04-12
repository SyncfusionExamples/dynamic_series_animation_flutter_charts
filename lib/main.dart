import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  ChartSeriesController? _chartSeriesController;
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 45, secondSeriesYValue: 1000),
    ChartSampleData(x: 'Feb', y: 100, secondSeriesYValue: 3000),
    ChartSampleData(x: 'March', y: 25, secondSeriesYValue: 1000),
    ChartSampleData(x: 'April', y: 100, secondSeriesYValue: 7000),
    ChartSampleData(x: 'May', y: 85, secondSeriesYValue: 5000),
    ChartSampleData(x: 'June', y: 140, secondSeriesYValue: 7000)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 450,
              child: SfCartesianChart(
                backgroundColor: Colors.white,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(
                    minimum: 0,
                    interval: 25,
                    maximum: 150,
                    majorGridLines: MajorGridLines(width: 0)),
                series: <ChartSeries<ChartSampleData, String>>[
                  ColumnSeries<ChartSampleData, String>(
                      animationDuration: 2000,
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartData,
                      xValueMapper: (ChartSampleData sales, _) => sales.x,
                      yValueMapper: (ChartSampleData sales, _) => sales.y,
                      name: 'Unit Sold'),
                ],
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: ButtonTheme(
                        minWidth: 40.0,
                        height: 30.0,
                        child: ElevatedButton(
                          onPressed: () {
                            _chartSeriesController?.animate();
                          },
                          child: Text('Animate column series',
                              textScaleFactor: 1,
                              style: TextStyle(color: Colors.white)),
                        ))),
              ],
            )
          ]),
        ));
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.y, this.secondSeriesYValue});

  final String? x;
  final double? y;
  final double? secondSeriesYValue;
}
