import 'package:flutter/material.dart';
import 'package:garry_potter/service/network_service.dart';

import '../model/books_model.dart';


class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: Network.methodGet(
          api: Network.apiAllBooks,id: id),
      initialData: "No Data",
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(child: Text("No Data",style: TextStyle(fontSize: 25),));
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator.adaptive());
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return OneBook(data: snapshot.data!);
            } else {
              return const Center(child: Text( "Something error, Please check your internet connecting!",style: TextStyle(fontSize: 25)));
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}

class OneBook extends StatelessWidget {
  final String data;
  const OneBook({Key? key,required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.sizeOf(context).height;
    final AllBooks allBooks = Network.parseBook(data);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(allBooks.attributes.cover,),
              const SizedBox(height: 30,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text("Author",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                  Text(allBooks.attributes.author,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                 ],
               ),
             ),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2.5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text("Release Date",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                  Text(allBooks.attributes.releaseDate,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                 ],
               ),
             ),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2.5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text("Pages",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                  Text(allBooks.attributes.pages.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                 ],
               ),
             ),
              const Padding(
               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2.5),
               child: Text("Summary\n",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
             ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2.5),
                child: Text(allBooks.attributes.summary,style: const TextStyle(fontSize: 20,)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
