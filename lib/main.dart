import 'package:flutter/material.dart';
import 'package:flutter_provider/gender_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
      create: (context) => GenderProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<GenderProvider>(
                      builder: (context, genderProvider, _) => Text(
                        'Gender Picker',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: genderProvider.color),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Consumer<GenderProvider>(
                            builder: (context, genderProvider, _) =>
                                GestureDetector(
                              onTap: () {
                                genderProvider.isMale = true;
                              },
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: genderProvider.maleColor),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/icon_male.png',
                                          color: genderProvider.maleColor,
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          'Male',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: genderProvider.maleColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Consumer<GenderProvider>(
                            builder: (context, genderProvider, _) =>
                                GestureDetector(
                              onTap: (() {
                                genderProvider.isMale = false;
                              }),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: genderProvider.femaleColor),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/icon_female.png',
                                          color: genderProvider.femaleColor,
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          'Feale',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  genderProvider.femaleColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}
