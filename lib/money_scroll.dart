import 'package:flutter/material.dart';

class MoneyScroll extends StatefulWidget {
  const MoneyScroll({Key? key}) : super(key: key);

  @override
  _MoneyScrollState createState() => _MoneyScrollState();
}

class _MoneyScrollState extends State<MoneyScroll> {
  ScrollController? scrollController;
  double totalWidthOfLine = 18;
  double currentPriceDouble = 500;
  Color? defaultColor = Colors.blue[600];
  double? updateOffset;
  //1st change
  double? negativeOffsetLength;
  //end of change

  //You can change the final price from here.
  final int finalPrice = 120000;

  String currentPrice = "500";
  String previousPrice = "";
  String nextPrice = "";

  int listViewLength = 0;

  bool drawLines(index) {
    if ((index + 1) % 5 == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void didChangeDependencies() {
    Size size = MediaQuery.of(context).size;
    double newOffset = 200 - (size.width / 2);
    //2nd change
    if (newOffset >= 0) {
      updateOffset = newOffset;
      negativeOffsetLength = 0;
    } else {
      updateOffset = 0;
      negativeOffsetLength = -1 * newOffset;
    }
    scrollController = ScrollController(initialScrollOffset: updateOffset!);
    //end of change

    scrollController!.addListener(updateWeight);

    previousPrice = (int.parse(currentPrice.toString()) - 500).toString();
    nextPrice = (int.parse(currentPrice.toString()) + 500).toString();
    listViewLength = ((finalPrice + 1500) / 500).round();
    super.didChangeDependencies();
  }

  void updateWeight() {
    setState(() {
      double userWeight = (scrollController!.offset - updateOffset!) * 5;
      double userFinalWeight = userWeight;
      currentPriceDouble = userFinalWeight + 500;
      //3rd change
      if (currentPriceDouble < 500) {
        currentPriceDouble = 500;
      }
      if (scrollController!.offset < updateOffset!) {
        scrollController!.animateTo(
          updateOffset!,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      }
      //end of change
      currentPrice = currentPriceDouble.round().toString();
      previousPrice = (currentPriceDouble - 500).round().toString();
      nextPrice = (currentPriceDouble + 500).round().toString();
      nextPriceCheck();
      previousPriceCheck();
      currentPriceCheck();
    });
  }

  void nextPriceCheck() {
    if (currentPriceDouble >= 99500) {
      nextPrice = nextPrice.substring(0, 3) + "." + nextPrice[3] + "K";
      return;
    }
    if (currentPriceDouble >= 9500) {
      nextPrice = nextPrice.substring(0, 2) + "." + nextPrice[2] + "K";
    }
  }

  void currentPriceCheck() {
    if (currentPriceDouble >= 100000) {
      currentPrice = currentPrice.substring(0, 3) + "." + currentPrice[3] + "K";
      return;
    }
    if (currentPriceDouble >= 10000) {
      currentPrice = currentPrice.substring(0, 2) + "." + currentPrice[2] + "K";
    }
  }

  void previousPriceCheck() {
    if (currentPriceDouble >= 100500) {
      previousPrice =
          previousPrice.substring(0, 3) + "." + previousPrice[3] + "K";
      return;
    }
    if (currentPriceDouble >= 10500) {
      previousPrice =
          previousPrice.substring(0, 2) + "." + previousPrice[2] + "K";
    }
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
            // padding: EdgeInsets.only(left: 5),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        previousPrice,
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        currentPrice,
                        style: TextStyle(
                            color: defaultColor!,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        nextPrice,
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
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
            //final change
            //wrap list view with a row and put list view on expanded, add this sized box on the row
            child: Row(
              children: [
                SizedBox(
                  width: negativeOffsetLength,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: listViewLength,
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
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
              ],
            ),
          ),
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
