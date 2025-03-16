import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/api_constants.dart';
import 'data/repositories/user_repository.dart';
import 'presentation/cubits/user_details/user_details_cubit.dart';
import 'presentation/cubits/user/users_cubit.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/users_screen.dart';
import 'presentation/screens/user_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => UsersCubit(UserRepository())..fetchUsers()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                titleTextStyle: TextStyle(fontSize: 16.sp),
              ),
            ),
            home: const SplashScreen(),
            routes: {'/users': (_) => UsersScreen()},
            onGenerateRoute: (settings) {
              if (settings.name == '/user-details') {
                final userId = settings.arguments as int;
                return MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => UserDetailsCubit(UserRepository())
                      ..fetchUserDetails(userId),
                    child: UserDetailsScreen(),
                  ),
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
