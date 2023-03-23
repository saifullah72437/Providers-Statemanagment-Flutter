import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/secondScreenProvider.dart';

class SecondScreenTwo extends StatelessWidget {
  const SecondScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SecondScreenProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen part 2'),
        actions: [
          MaterialButton(onPressed: (){
          Navigator.pop(context);
          },
            child: Text('Prev Page'),

          ),


        ],

      ),
      body: ListView.builder(
        itemCount: provider.isTapped.length,
          itemBuilder: (context, index){
            return ListTile(

              title: Text("item ${index}"),
              trailing: GestureDetector(
                onTap: (){
                  if(!provider.isTapped.contains(index)){
                    provider.addElement(index);
                    print(provider.isTapped);
                  }
                  else{
                    provider.removeElement(index);
                  }

                },
                child: Consumer<SecondScreenProvider> (
                    builder: (context, provider, child) =>  Icon(Icons.favorite, color: provider.isTapped.contains(index)? Colors.red:Colors.grey,)),
              ),
            );
          }),
    );
  }
}
