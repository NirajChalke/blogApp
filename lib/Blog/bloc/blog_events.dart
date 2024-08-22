abstract class AppEvents{
  const AppEvents();

}

class TriggerlikeEvent extends AppEvents{
final bool isliked;
const TriggerlikeEvent({required this.isliked});
}
class TriggertextEvent extends AppEvents{
final bool showMore;
const TriggertextEvent({required this.showMore});
}
class TriggerLikeEvent extends AppEvents {
  final String blogId;

  const TriggerLikeEvent({required this.blogId});
}