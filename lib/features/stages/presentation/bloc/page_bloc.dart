import 'package:bloc/bloc.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/page_state.dart';
import 'package:pizzaapp/features/stages/presentation/bloc/pageevent.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageState()) {
    on<NextPage>((event, emit) {
      if (event.curPageIndex < 2) {
        emit(PageState(index: event.curPageIndex + 1));
      }
    });
    on<PrevPage>((event, emit) {
      if (event.curPageIndex > 0) {
        emit(PageState(index: event.curPageIndex - 1));
      }
    });
    on<PageChangedEvent>((event, emit) {
      emit(PageState(index: event.newIndex));
    });
  }
}
