import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/home_screen_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    print('object');

    final provider = Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          provider.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<HomeScreenProvider> (
        builder: (context, provider, child) =>  Center(child: Text('${provider.count}',style: TextStyle(fontSize: 50),),),
      ),
    );
  }
}
