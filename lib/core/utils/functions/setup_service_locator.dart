import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../features/home/data/data_sources/home_local.dart';
import '../../../features/home/data/data_sources/home_remote.dart';
import '../../../features/home/data/repos/home_repo_impl.dart';

import '../api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataImpl(),
      homeRemoteDataSource: HomeRemoteImpl(
       getIt.get<ApiServices>()
      ),
    ),
  );

  getIt.registerSingleton<ApiServices>(
    ApiServices(Dio()),
  );
}
