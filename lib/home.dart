import 'package:artivatic_task/bloc/home_bloc.dart';
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
           return Center(child: Text("Data Got"));
         }

         return Center(child: Text("Error"));


      },)
    );
  }
}
