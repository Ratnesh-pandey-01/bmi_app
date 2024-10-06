import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var wtControlller = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              "Your Bmi",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            color: bgColor,
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wtControlller,
                      decoration: InputDecoration(
                        label: Text("Enter your Weight in (kg)"),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        label: Text(
                          "Enter your height (in feet)",
                        ),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text("Enter your height (in inches)"),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtControlller.text.toString();
                          var ft = ftController.text.toString();
                          var inch = inController.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tinch = (iFt * 12) * iInch;

                            var tcm = tinch * 2.54;

                            var tm = tcm / 100;

                            var bmi = iWt / (tm * tm);

                            var msg = "";

                            if (bmi > 25) {
                              msg = "You are overweight!!";
                              bgColor = Colors.orange.shade200;
                            } else if (bmi < 18) {
                              msg = "You are underweight!!";
                              bgColor = Colors.red.shade200;
                            } else {
                              msg = "You are healthy!!";
                              bgColor = Colors.green.shade200;
                            }
                            setState(() {
                              result =
                                  " $msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill all the required blanks!!";
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
