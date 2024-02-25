//event class for pages.
abstract class PageEvent{}

class NextPage extends PageEvent{
  final int curPageIndex;
  NextPage({required this.curPageIndex});
}

class PrevPage extends PageEvent{
  final int curPageIndex;
  PrevPage({required this.curPageIndex});
}

class PageChangedEvent extends PageEvent{

  final int newIndex;

  PageChangedEvent({required this.newIndex});
}