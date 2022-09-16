import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'logic_function.dart';
//import 'functions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: GradientColors.alchemistLab,
              ),
            ),
          ),
          actions: [
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text(' Robotic mode '),
              Switch(
                activeColor: Colors.lightGreenAccent,
                value: automaticMode,
                onChanged: (value) {
                  setState(() {
                    automaticMode = value;
                  });

                  ;
                },
              )
            ]),
          ],
          title: Text(
            'tic tac toa',
            style: GoogleFonts.theGirlNextDoor(
                textStyle: const TextStyle(
                  fontSize: 32,
                )),
          ),
        ),
        body: SafeArea(
          child: Container(
            //color: Colors.grey,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: GradientColors.	royalBlue,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.theGirlNextDoor(
                          textStyle: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (playground[index] == '') {
                                setPlayerOnPlayground(index);
                                setState(() {});
                              }
                            },
                            child: Container(
                              //color: Colors.blue,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: GradientColors.darkOcean,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  playground[index],
                                  style: GoogleFonts.theGirlNextDoor(
                                    textStyle: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Container(
                  height: 55.0,
                  width: 55.0,
                  margin: const EdgeInsets.symmetric(horizontal: 100.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: GradientColors.alchemistLab,
                    ),
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(5.0),
                    icon: Icon(
                      Icons.refresh_outlined,
                      size: 48,
                      color: Colors.green[900],
                    ),
                    onPressed: () {
                      refreshPlayground();
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
