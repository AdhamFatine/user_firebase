import 'package:flutter/material.dart';
import 'package:user_firebase/model/user.model.dart';
import 'package:user_firebase/repository/user.repo.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ctrname = TextEditingController();
    final _ctrage = TextEditingController();
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: _ctrname,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _ctrage,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    final user = User(name: _ctrname.text, age: int.parse(_ctrage.text));
                    addUser(user);
                    _ctrname.text='';
                    _ctrage.text='';
                  },
                  child: Container(width: double.infinity, child: Icon(Icons.add, size: 32,),))
            ],
          ),
        ),
      ),
    );
  }
}
