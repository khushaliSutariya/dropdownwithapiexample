import 'package:flutter/material.dart';

import '../models/users.dart';
import '../resources/URLResources.dart';
import '../utility/ApiHandler.dart';
class userdataScreens extends StatefulWidget {
  @override
  State<userdataScreens> createState() => _userdataScreensState();
}

class _userdataScreensState extends State<userdataScreens> {
  List<users>? allusers;
  bool loading = false;

  var selected="";
  var count=0;
  getdata() async {
    setState(() {
      loading = true;
    });
    await ApiHandler.getCall(URLResources.USERS_ACCOUNT).then((json) {

      setState(() {
        allusers = json.map<users>((obj) => users.fromJson(obj)).toList();
        selected = allusers![0].id.toString();
        loading = false;
      });

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UsersWithDatabaseHandler"),
      ),
      body:  (loading)
          ? Center(
        child: CircularProgressIndicator(),
      ): Column(
        children:
        allusers!.map<Container>((obj){
          return Container(
            child: Text(obj.name.toString()),
          );
        }).toList(),
      )
      //     : DropdownButton(
      //   value: selected,
      //   onChanged: (val)
      //   {
      //     setState(() {
      //       selected=val!;
      //     });
      //   },
      //   items: allusers!.map<DropdownMenuItem>((obj){
      //     return DropdownMenuItem(
      //       child: Text(obj.name.toString()),
      //       value: obj.id.toString(),
      //     );
      //   }).toList(),
      // )
    );
  }
}
