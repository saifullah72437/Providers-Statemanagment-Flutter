import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  const NotifyListnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object');

    ValueNotifier<int> _counter = ValueNotifier<int>(0);
    ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        _counter.value++;
          },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(valueListenable: _toggle, builder: (context, value, child){
              return TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: InkWell(
                      onTap: (){
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(_toggle.value ?  Icons.visibility_off : Icons.visibility )),

                ),
                obscureText: _toggle.value,

              );
            }),



            ValueListenableBuilder(valueListenable: _counter, builder: (context, value, child){
              return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);

            }
            )

          ],
        ),
      ),
    );
  }
}
