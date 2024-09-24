import 'package:flutter/material.dart';
import 'package:sqf_lite/screens/detailScreen.dart';
import 'package:sqf_lite/services/local_database.dart';
import 'package:sqf_lite/widgets/customRowWidget.dart';
import 'package:sqf_lite/widgets/dialogBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocalDatabase ldb = LocalDatabase();

  List<Map<String, dynamic>>? listofdata;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Retrieve the data from the local database
    var data = await ldb.retrieveValue();
    setState(() {
      listofdata = data;
    });
  }

  Future<void> _deleteData(int index) async {
    var item = listofdata![index];
    await ldb.deleteValue(item['name'], item['age'], item['place'], item['email']);
    _loadData(); // Reload the data after deletion
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("List of data"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: listofdata != null && listofdata!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: listofdata?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration:
                          BoxDecoration(color: Colors.indigo[50],
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
                                  title: 'Name', value: listofdata![index]['name']),
                              CustomRowWidget(
                                  title: 'Age',
                                  value: listofdata![index]['age'].toString()),
                              CustomRowWidget(
                                  title: 'Place',
                                  value: listofdata![index]['place']),
                              CustomRowWidget(
                                  title: 'Email',
                                  value: listofdata![index]['email']),
                            ],
                          ),
                          Spacer(),
                          Column(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(name: listofdata![index]['name'],age: listofdata![index]['age'],email: listofdata![index]['email'],place: listofdata![index]['place'],isUpdate: true,))).then((_) => _loadData());
                            }, 
                            icon: Icon(Icons.edit)
                            ),
                            IconButton(
                              onPressed: (){
                                showDialog(context: context, builder:(context){
                                  return DialogBox( onConfirm: () {
                                            _deleteData(index);
                                            Navigator.pop(context);
                                          },);
                                });
                              }, 
                              icon: Icon(Icons.delete)
                              )
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
              context, MaterialPageRoute(builder: (context) => DetailScreen())).then((_)  => _loadData());;
          _loadData();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo[100],
      ),
    ));
  }
}
