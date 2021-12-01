import 'package:flutter/material.dart';

class MoneyScroll extends StatefulWidget {
  const MoneyScroll({Key? key}) : super(key: key);

  @override
  _MoneyScrollState createState() => _MoneyScrollState();
}

class _MoneyScrollState extends State<MoneyScroll> {
  ScrollController? scrollController;
  final int drawLine = 104;
  double totalWeight = 500;
  double totalWidthOfLine = 18;
  Color? defaultColor = Colors.blue[400];
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController!.addListener(updateWeight);

    super.initState();
  }

  bool drawLines(index) {
    if ((index + 1) % 5 == 1) {
      return true;
    } else {
      return false;
    }
  }

  void updateWeight() {
    setState(() {
      print("SCROLL OFFSET ${scrollController!.offset.toString()}");

      double userWeight = scrollController!.offset * 5;
      double userFinalWeight = userWeight;
      totalWeight = userFinalWeight + 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'PKR',
                    style: TextStyle(
                        color: defaultColor!,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  totalWeight.toStringAsFixed(0),
                  style: TextStyle(
                      color: defaultColor!,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: defaultColor!,
                  size: 38,
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 10,
            child: ListView.builder(
                itemCount: drawLine,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(index) * 500}",
                        style: TextStyle(color: defaultColor),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //40 , 15
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Container(
                              height: 15,
                              width: 1,
                              color: Colors.blue[300],
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                          ]),
                    ],
                  );
                }),
          ),
          // Container(
          //   height: 40,
          //   width: double.infinity,
          //   color: Colors.grey[200],
          // ),
          SizedBox(
            height: size.height / 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              child: Text("Access my money", style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }
}
