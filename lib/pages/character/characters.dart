
import 'package:flutter/material.dart';
import '../../service/network_service.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  List<Characters> list = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }
  void getAllData() async{
    String? data = await Network.methodGet(api: Network.apiCharacters);
    //list = Network.parseCharacterList(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("All Books",style: TextStyle(fontSize: 25,color: Colors.black),),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            final item = list[index];
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                children: [
                  const Text("Type: ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                 Text("",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}

