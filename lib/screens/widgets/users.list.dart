import 'package:flutter/material.dart';
import 'package:user_firebase/repository/user.repo.dart';

import '../../model/user.model.dart';

class ListUsers extends StatefulWidget {
  List<User> users;
  ListUsers({required this.users});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    final allusers = widget.users;
    final _ctrlupdatename = TextEditingController();
    final _ctrlupdateage = TextEditingController();

    return ListView.builder(
        itemCount: allusers.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(allusers[index].name.substring(0,2).toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              title: Text(allusers[index].name, style: TextStyle(fontSize: 22),),
              subtitle: Text(allusers[index].age.toString(), style: TextStyle(fontSize: 18),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text('Update: ${allusers[index].name}'),
                            content: SingleChildScrollView(
                              child: Container(
                                height: 250,
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(fontSize: 22,),
                                      decoration: InputDecoration(labelText: 'Name',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrlupdatename,
                                    ),
                                    SizedBox(height: 20,),
                                    TextField(
                                      style: TextStyle(fontSize: 22,),
                                      decoration: InputDecoration(labelText: 'Age',
                                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrlupdateage,
                                    ),
                                    SizedBox(height: 20,),
                                    ElevatedButton(onPressed: (){
                                      final user = User(id: allusers[index].id,
                                          name: _ctrlupdatename.text,
                                          age: int.parse(_ctrlupdateage.text));
                                      updateUser(user);
                                    },
                                        child: Container(width: double.infinity, child: Text('Update'),))
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context,"Annuler");
                              },
                                  child: Text('Annuler'))
                            ],
                          ));
                    },
                    child: Icon(Icons.edit, size: 32, color: Colors.green),
                  ),
                  TextButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text('Voulez-vous vraiment supprimer ${allusers[index].name} ?'),
                            actions: [
                              ElevatedButton(
                                  onPressed: (){
                                    deleteUser(allusers[index].id);
                                    Navigator.pop(context, 'oui');
                                  },
                                  child: Text('Oui')),
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context, 'Annuler');
                                  },
                                  child: Text('Non')),
                            ],
                          ));
                    },
                    child: Icon(Icons.delete, size: 32, color: Colors.red),
                  ),
                ],
              )
            ),
          );
        });
  }
}
