class AppState{
   bool? isliked=false;
   bool? showMore=false;
  AppState({ this.isliked, this.showMore});

  AppState copyWith ({bool? isliked,bool?showMore}){
    return AppState(isliked: isliked??this.isliked, showMore: showMore??this.showMore);
  }
}