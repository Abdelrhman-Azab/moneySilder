import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class NewSlider extends StatefulWidget {
  const NewSlider({Key? key}) : super(key: key);

  @override
  _NewSliderState createState() => _NewSliderState();
}

class _NewSliderState extends State<NewSlider> {
  double sliderValue = 45000;
  double min = 0;
  double max = 90000;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String sliderString = sliderValue.round().toString();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter amount you want to withdraw",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Rs",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        alignment: Alignment.center,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          sliderValue > 999
                              ? sliderString.substring(
                                      0, sliderString.length - 3) +
                                  "," +
                                  sliderString.substring(
                                      sliderString.length - 3,
                                      sliderString.length)
                              : sliderString,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                              fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SfSliderTheme(
                      data: SfSliderThemeData(
                        thumbStrokeWidth: 4,
                        thumbStrokeColor: Colors.blue,
                        thumbColor: Colors.white,
                        activeTrackHeight: 8,
                        inactiveTrackHeight: 8,
                      ),
                      child: SfSlider(
                        min: 0,
                        max: 90000,
                        labelFormatterCallback: (actualValue, formattedText) {
                          String newText = (double.parse(formattedText) / 1000)
                              .round()
                              .toString();
                          return newText == min.round().toString()
                              ? "$newText"
                              : "$newText\k";
                        },

                        // thumbIcon: Icon(Icons.close),
                        // labelFormatterCallback: ,
                        value: sliderValue,
                        showLabels: true,
                        interval: max / 2,

                        // numberFormat: NumberFormat(),
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
