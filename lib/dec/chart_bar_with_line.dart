import 'package:flutter/material.dart';
import 'package:moneyscroll/dec/newchart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart' as core;

class ChartBarWithLine extends StatefulWidget {
  const ChartBarWithLine(
      {Key? key, required this.getTransactionData, required this.salaryMax})
      : super(key: key);
  final List<TransactionData> getTransactionData;
  final double salaryMax;
  @override
  _ChartBarWithLineState createState() => _ChartBarWithLineState();
}

TrackballBehavior? _trackballBehavior;
late ZoomPanBehavior _zoomPanBehavior;

class _ChartBarWithLineState extends State<ChartBarWithLine> {
  Color pinkcolor = const Color(0xffEC0B8D);
  @override
  void initState() {
    //print(widget.getTransactionData.toString());
    //print();
    // print('salary ${widget.salaryMax}');
    // widget.getTransactionData.forEach((element) {
    //   print(element.toMap());
    // });
    // print('done');
    // getTransactionData.forEach((element) {
    //   print(element.toMap());
    // });
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      shouldAlwaysShow: true,
      markerSettings: TrackballMarkerSettings(
          markerVisibility: TrackballVisibilityMode.visible),
      lineColor: pinkcolor,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      tooltipAlignment: ChartAlignment.far,
      lineWidth: 2,
      builder: (context, trackballDetails) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                          "${trackballDetails.point!.x.toString()} Transactions : ",
                    ),
                    TextSpan(
                      text:
                          "${(trackballDetails.point!.y).round().toString()}K",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: pinkcolor),
                    ),
                  ]),
            ),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sMax = (widget.salaryMax / 1000);

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 440,
          width: double.infinity,
          child: SfCartesianChart(
            zoomPanBehavior: _zoomPanBehavior,

            plotAreaBorderWidth: 0,
            borderWidth: 0,
            trackballBehavior: _trackballBehavior,
            primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
                plotOffset: 0,
                edgeLabelPlacement: EdgeLabelPlacement.none,
                visibleMaximum: 5,
                interval: 1,
                plotBands: <PlotBand>[
                  PlotBand(
                      isVisible: true,
                      start: 0,
                      end: 0.8,
                      color: Color(0xfffff3f5)),
                  PlotBand(
                      isVisible: true,
                      start: 1,
                      end: 1.8,
                      color: Color(0xffFBFAFF)),
                  PlotBand(
                      isVisible: true,
                      start: 2,
                      end: 2.8,
                      color: Color(0xffFBFAFF)),
                  PlotBand(
                      isVisible: true,
                      start: 3,
                      end: 3.8,
                      color: Color(0xffFBFAFF)),
                ]),
            primaryYAxis: NumericAxis(
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              visibleMaximum: sMax,
              maximumLabels: 5,
              minimum: 0,
              maximum: sMax,
              labelFormat: '{value}K',
              // here how Y axis is divided
              interval: 5,
            ),
            onPlotAreaSwipe: (direction) {},
            //palette: [],
            // onZoomStart: (zoomingArgs) {
            //   zoomingArgs.currentZoomPosition = 0.5;
            // },
            series: <ChartSeries>[
              AreaSeries<TransactionData, String>(

                  //   color: Colors.blue[100],

                  borderColor: Colors.blue,
                  gradient: LinearGradient(colors: [
                    Color(0xff1ABCFE).withOpacity(0.6),
                    Color(0xff00A2FF).withOpacity(0)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderWidth: 3,
                  // markerSettings: const MarkerSettings(
                  //   isVisible: false,
                  //   shape: DataMarkerType.diamond,
                  // ),
                  dataSource: widget.getTransactionData,
                  xValueMapper: (TransactionData transactionData, index) {
                    return transactionData.month;
                  },
                  yValueMapper: (TransactionData transactionData, index) {
                    return transactionData.trans / 1000;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// class TransactionData {
//   String month;
//   double trans;
//   TransactionData(this.month, this.trans);
// }

// Color blueColor = Color(0xff1ABCFE);

// List<TransactionData> getTransactionData = [
//   TransactionData("Jan", 40),
//   TransactionData("Feb", 55),
//   TransactionData("Mar", 45),
//   TransactionData("Apr", 100),
//   TransactionData("May", 90),
//   TransactionData("jun", 70),
//   TransactionData("jul", 60.2),
//   TransactionData("aug", 90.5),
//   TransactionData("sep", 30.6),
//   TransactionData("oct", 60.7),
//   TransactionData("nov", 100),
//   TransactionData("dec", 90),
// ];
