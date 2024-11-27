import 'package:clean_artich/core/params/params.dart';
import 'package:clean_artich/core/services/service_locator.dart';
import 'package:clean_artich/features/user/domain/usecases/get_user.dart';
import 'package:clean_artich/features/user/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser getUser;
  UserCubit()
      : getUser = getIt<GetUser>(),
        super(UserInitial());

  eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final failureOrUser = await getUser.call(
      params: UserParams(
        id: id.toString(),
      ),
    );
    failureOrUser.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
