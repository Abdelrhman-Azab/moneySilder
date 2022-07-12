import 'package:flutter/material.dart';

class MoneyChartScreen extends StatefulWidget {
  const MoneyChartScreen({Key? key}) : super(key: key);

  @override
  _MoneyChartScreenState createState() => _MoneyChartScreenState();
}

//change target money
double targetMoney = 9000;
//change chart height
double chartHeight = 400;

List<double> verticalColumnMoney = [0];

Map<String, Money> months = {
  "Jan": Money(deposite: 3000, withdrawl: 2000),
  "Feb": Money(deposite: 4000, withdrawl: 3000),
  "Mar": Money(deposite: 5000, withdrawl: 4000),
  "Apr": Money(deposite: 7000, withdrawl: 5000),
  "May": Money(deposite: 9000, withdrawl: 6000),
  "Jun": Money(deposite: 6000, withdrawl: 3000),
  "Jul": Money(deposite: 2000, withdrawl: 1000),
  "Aug": Money(deposite: 8000, withdrawl: 5000),
  "Sep": Money(deposite: 7000, withdrawl: 2000),
  "Oct": Money(deposite: 5000, withdrawl: 2000),
  "Nov": Money(deposite: 4000, withdrawl: 2000),
  "Dec": Money(deposite: 3000, withdrawl: 2000)
};

class Money {
  double deposite;
  double withdrawl;
  Money({required this.deposite, required this.withdrawl});
}

Color pinkColor = const Color(0xffEC0B8D);
Color blueColor = const Color(0xff1ABCFE);

double chartcontainerHeight = chartHeight - 50;
double chartitemHeight = chartcontainerHeight - 80;
double sizedBoxHeight = 40 - (chartitemHeight / 18);

class _MoneyChartScreenState extends State<MoneyChartScreen> {
  @override
  void initState() {
    double firstAmount = targetMoney / 9;
    for (double x = 1; x <= 9; x++) {
      verticalColumnMoney.add(firstAmount * x);
    }
    verticalColumnMoney = List.from(verticalColumnMoney.reversed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: chartHeight,
          width: size.width,
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ...List.generate(
                                          10,
                                          (index) => Container(
                                              alignment: Alignment.center,
                                              height: chartitemHeight / 9,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    child: Text(
                                                      (verticalColumnMoney[
                                                                      index] /
                                                                  1000)
                                                              .toStringAsFixed(
                                                                  1) +
                                                          "K",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[700]),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 1,
                                                      color: Colors.grey[300],
                                                    ),
                                                  )
                                                ],
                                              ))),
                                      SizedBox(
                                        height: sizedBoxHeight,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return chartItem(
                                                  month: months.keys
                                                      .elementAt(index),
                                                  chartHeight: chartHeight,
                                                  money: months[months.keys
                                                      .elementAt(index)]!,
                                                  targetMoney: targetMoney);
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                width: 15,
                                              );
                                            },
                                            itemCount: months.length),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 15, child: Divider()),
                Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: blueColor,
                        radius: 6,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Deposit"),
                      SizedBox(
                        width: 40,
                      ),
                      CircleAvatar(
                        backgroundColor: pinkColor,
                        radius: 6,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Withdrawl"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container chartItem(
    {required String month,
    required Money money,
    required double chartHeight,
    required double targetMoney}) {
  double depositePercent = money.deposite / targetMoney;
  double withdrawlPercent = money.withdrawl / targetMoney;
  if (depositePercent > 1) {
    depositePercent = 1;
  }
  if (withdrawlPercent > 1) {
    withdrawlPercent = 1;
  }
  double chartContainerHeight = chartHeight - 50;
  return Container(
    height: chartContainerHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 12,
          height: chartContainerHeight - 80,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: depositePercent * (chartContainerHeight - 80),
                width: 12,
                decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              Container(
                height: withdrawlPercent * (chartContainerHeight - 80),
                width: 12,
                decoration: BoxDecoration(
                    color: pinkColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            height: 20,
            child: Text(month, style: TextStyle(color: Colors.grey[700])))
      ],
    ),
  );
}
