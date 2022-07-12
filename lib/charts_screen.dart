import 'package:flutter/material.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({Key? key}) : super(key: key);

  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

Map<String, double> months = {
  "Jan": 0.2,
  "Feb": 0.4,
  "Mar": 0.6,
  "Apr": 0.3,
  "May": 0.2,
  "Jun": 0.5,
  "Jul": 0.7,
  "Aug": 0.3,
  "Sep": 0.2,
  "Oct": 1,
  "Nov": 0.4,
  "Dec": 0.6
};

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 300,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return chartItem(
                                month: months.keys.elementAt(index),
                                percent: months[months.keys.elementAt(index)]!);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: months.length),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container chartItem({required String month, required double percent}) {
    if (percent > 1) {
      percent = 1;
    }
    return Container(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 25,
            height: percent * 150,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(height: 20, child: Text(month))
        ],
      ),
    );
  }
}
