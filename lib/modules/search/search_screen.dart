import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/componets.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){

        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  Function: Function,
                  validate: (String? value){
                    if(value!.isEmpty){
                      return'No result!';
                    }
                    return null;
                  },
                  label: 'Search',
                  preifix: Icons.search,
                ),
              ),
              Expanded(
                  child: articleBuilder(list, context, isSearch: true),),
            ],
          ),
        );
      },
    );
  }

}
