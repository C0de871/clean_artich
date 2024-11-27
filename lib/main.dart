import 'package:clean_artich/core/databases/cache/cache_helper.dart';
import 'package:clean_artich/core/services/service_locator.dart';
import 'package:clean_artich/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_artich/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
