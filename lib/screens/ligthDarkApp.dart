import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/lightDarkProvider.dart';

class LightDarkApp extends StatelessWidget {
  const LightDarkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LightDarkProvider>(context, listen: false);
    print('object');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<LightDarkProvider>(
              builder: (context, provider, child) => Slider(
                value: provider.currentValue,
                onChanged: (value) {
                  max(1, 1);
                  min(0, 0);
                  provider.changed(value);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Consumer<LightDarkProvider> (builder: (context, provider, child)=> Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(provider.currentValue),
                    ),
                    child: Center(child: Text('Green Container')),

                  ),),
                ),
                Expanded(child: Consumer<LightDarkProvider>(builder: (context, provider, child) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(provider.currentValue),
                  ),
                  child: Center(child: Text('Red Container')),
                ),))

              ],
            )
          ],
        ),
      ),
    );  }
}
