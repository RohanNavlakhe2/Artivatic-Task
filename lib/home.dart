import 'package:artivatic_task/bloc/home_bloc.dart';
import 'package:artivatic_task/model/rows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {

         if(state is HomeDataLoading){
            return Center(child: CircularProgressIndicator());
         }

         if(state is HomeDataSuccess){
           if(state.homeData.rows?.isNotEmpty ?? false){
             return ListView.builder(itemBuilder: (context, index) {
               return listTile(state.homeData.rows![index]);
             },itemCount: state.homeData.rows!.length,);
           }else
             return Center(child: Text("No Data Found"));
         }

         return Center(child: Text("Error"));


      },)
    );
  }

  Widget listTile(ItemRow row){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue,width: 0.5),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(row.title ?? "Title not available",style: TextStyle(color: Colors.black,fontSize: 18),),
          SizedBox(height: 8,),
          Text(row.description ?? "Description not available",style: TextStyle(color: Colors.grey,fontSize: 15),),
          SizedBox(height: 8,),
          Image.network(row.imageHref ?? "Image not available",
            errorBuilder: (context, error, stackTrace) {
              return Text("Image not available");
          },
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress == null)
                  return child;
                else
                  return Text("Loading Image...");
              }
          )
        ],
      ),
    );
  }
}
