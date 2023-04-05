import 'package:edu_ecommerce_bloc/cubits/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListing extends StatelessWidget {
  const UserListing({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UsersCubit>().fetchUsers();

    return BlocBuilder<UsersCubit, UsersDataState>(
      builder: (context, state) {
        if (state is UsersDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UsersDataLoaded) {
          return ListView(
            children: state.users.map((user) {
              return ListTile(title: Text(user["username"]));
            }).toList(),
          );
        } else if (state is UsersDataError) {
          return const Text("Data Error");
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
