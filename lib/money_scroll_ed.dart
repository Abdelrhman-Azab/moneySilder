import 'package:flutter/material.dart';

class MoneyScrollEd extends StatefulWidget {
  const MoneyScrollEd(
      {Key? key, required this.addAmount, required this.processTransaction})
      : super(key: key);
  final Function addAmount;
  final Function processTransaction;
  @override
  _MoneyScrollEdState createState() => _MoneyScrollEdState();
}

class _MoneyScrollEdState extends State<MoneyScrollEd> {
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
      //print("SCROLL OFFSET ${scrollController!.offset.toString()}");

      double userWeight = scrollController!.offset * 5;
      double userFinalWeight = userWeight;
      totalWeight = userFinalWeight + 500;
      widget.addAmount(
        totalWeight.toStringAsFixed(0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var rightSide = totalWeight - 500;
    var leftSide = totalWeight + 500;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rightSide.toStringAsFixed(0),
                        style: TextStyle(
                          color: defaultColor!,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 85,
                      ),
                      Text(
                        totalWeight.toStringAsFixed(0),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: defaultColor!,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 85,
                      ),
                      Text(
                        leftSide.toStringAsFixed(0),
                        style: TextStyle(
                          color: defaultColor!,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: defaultColor!,
                  size: 38,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 10,
            child: ListView.builder(
                itemCount: drawLine,
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   color: Colors.red,
                      //   width: 50,
                      //   height: 20,
                      //   child: Text(
                      //     "${(index) * 500} -",
                      //     style: TextStyle(color: defaultColor),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
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

          // Container(
          //   width: 200,
          //   margin: const EdgeInsets.only(
          //     bottom: 20,
          //   ),
          //   child: PrimarySubmitButton(
          //     onPressed: () {
          //       widget.processTransaction();
          //     },
          //     text: 'Button.Next'.tr(),
          //     enableStatus: true,
          //   ),
          // ),
        ],
      ),
    );
  }
}
