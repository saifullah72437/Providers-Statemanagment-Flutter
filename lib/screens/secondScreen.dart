import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/secondScreenProvider.dart';
import 'package:statemanagement/screens/secondScreenTwo.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SecondScreenProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        actions: [
          MaterialButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)
            =>
                SecondScreenTwo()
            ),);
          },
            child: Text('Next Page'),

          ),

        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(

              title: Text("item ${index}"),
              trailing: GestureDetector(
                onTap: () {
                  if (!provider.isTapped.contains(index)) {
                    provider.addElement(index);
                    print(provider.isTapped);
                  }
                  else {
                    provider.removeElement(index);
                  }
                },
                child: Consumer<SecondScreenProvider>(
                    builder: (context, provider, child) =>
                        Icon(Icons.favorite,
                          color: provider.isTapped.contains(index)
                              ? Colors.red
                              : Colors.grey,)),
              ),
            );
          }),
    );
  }
}
