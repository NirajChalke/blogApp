class AppState{
   bool isliked=false;
   bool showMore=false;
  AppState({required this.isliked,required this.showMore});

  AppState copyWith ({bool? isliked,bool?showMore}){
    return AppState(isliked: isliked??this.isliked, showMore: showMore??this.showMore);
  }
}