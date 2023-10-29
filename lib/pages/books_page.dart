
import 'package:flutter/material.dart';
import 'package:garry_potter/pages/detail_page.dart';
import '../model/books_model.dart';
import '../service/network_service.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  AllBooks? allBooks;
  List <AllBooks> list = [];

   @override
  void initState() {
    super.initState();
    getAllData();
  }
  void getAllData() async{
      String? data =  await Network.methodGet(api: Network.apiAllBooks);
      list = Network.parseBooksList(data!);
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
            final allbooks = list[index];
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: ListTile(

                leading: Image.network(allbooks.attributes.cover,),
                title: Text(allbooks.attributes.title,style: Theme.of(context).textTheme.titleMedium,),
                subtitle: Text(allbooks.attributes.releaseDate),
                trailing: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(id: allbooks.id)));
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

