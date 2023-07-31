import 'package:dio/dio.dart';
import 'package:ebook/constants.dart';
import 'package:ebook/core/utils/api_services.dart';
import 'package:ebook/core/utils/app_router.dart';
import 'package:ebook/features/home/data/data_sources/home_local.dart';
import 'package:ebook/features/home/data/data_sources/home_remote.dart';
import 'package:ebook/features/home/data/repos/home_repo_impl.dart';
import 'package:ebook/features/home/domain/entities/book_entitiy.dart';
import 'package:ebook/features/home/domain/use_cases/fetch_featured_books.dart';
import 'package:ebook/features/home/domain/use_cases/fetch_newest_books.dart';
import 'package:ebook/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataImpl(),
                homeRemoteDataSource: HomeRemoteImpl(
                  ApiServices(
                    Dio(),
                  ),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            FetchNewestBooksUseCase(
              HomeRepoImpl(
                homeLocalDataSource: HomeLocalDataImpl(),
                homeRemoteDataSource: HomeRemoteImpl(
                  ApiServices(
                    Dio(),
                  ),
                ),
              ),
            ) ,
          );
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
