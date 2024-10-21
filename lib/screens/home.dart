import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/main.dart';
import 'package:sqf_lite/screens/detailScreen.dart';
import 'package:sqf_lite/services/local_database.dart';
import 'package:sqf_lite/services/provider.dart';
import 'package:sqf_lite/widgets/customRowWidget.dart';
import 'package:sqf_lite/widgets/dialogBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalDatabase ldb = LocalDatabase();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    provider.loadData();

    Future<void> deleteData(int index) async {
      var item = provider.listofdata[index];
      provider.deleteData(item);
    }

    

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("List of data"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: provider.listofdata.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: provider.listofdata.length,
                  itemBuilder: (context, index) {
                    final dataItem = provider.listofdata[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(8, 8),
                                blurRadius: 15,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ]),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRowWidget(
                                  title: 'Name', value: dataItem['name']),
                              CustomRowWidget(
                                  title: 'Age',
                                  value: dataItem['age'].toString()),
                              CustomRowWidget(
                                  title: 'Place', value: dataItem['place']),
                              CustomRowWidget(
                                  title: 'Emails', value: dataItem['email']),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                  name: dataItem['name'],
                                                  age: dataItem['age'],
                                                  email: dataItem['email'],
                                                  place: dataItem['place'],
                                                  isUpdate: true,
                                                )));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogBox(
                                            onConfirm: () {
                                              deleteData(index);
                                              Navigator.pop(context);
                                            },
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          : Center(child: Text("No data yet")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo[100],
      ),
    ));
  }
}
