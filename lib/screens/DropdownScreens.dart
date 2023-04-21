import 'package:flutter/material.dart';
class DropdownScreens extends StatefulWidget {
  const DropdownScreens({Key? key}) : super(key: key);

  @override
  State<DropdownScreens> createState() => _DropdownScreensState();
}

class _DropdownScreensState extends State<DropdownScreens> {

  var selected="i3";
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Column(
        children: [
          DropdownButton(
            value: selected,
            onChanged: (val)
            {
              setState(() {
                selected=val!;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text("Item 1"),
                value: "i1",
              ),
              DropdownMenuItem(
                child: Text("Item 2"),
                value: "i2",
              ),
              DropdownMenuItem(
                child: Text("Item 3"),
                value: "i3",
              ),
              DropdownMenuItem(
                child: Text("Item 4"),
                value: "i4",
              ),
            ],
          ),
          ElevatedButton(onPressed: (){
            print(selected);
          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
