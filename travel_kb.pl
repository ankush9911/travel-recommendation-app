destination(goa, 'Goa', 'India', beach, budget, winter, [sunbathing, nightlife, water_sports], 3).
destination(manali, 'Manali', 'India', mountain, mid, summer, [trekking, skiing, nature], 4).
destination(paris, 'Paris', 'France', city, luxury, spring, [museums, romance, food, culture], 5).
destination(bali, 'Bali', 'Indonesia', beach, mid, year_round, [surfing, retreats, culture], 5).
destination(leh, 'Leh Ladakh', 'India', adventure, mid, summer, [biking, trekking, high_altitude], 6).
destination(kyoto, 'Kyoto', 'Japan', cultural, mid, spring, [temples, cherry_blossom, culture], 4).
destination(iceland, 'Iceland', 'Iceland', nature, luxury, summer, [glaciers, northern_lights, hot_springs], 7).
destination(dharamshala, 'Dharamshala', 'India', mountain, budget, year_round, [meditation, trekking, nature], 3).
destination(newyork, 'New York City', 'USA', city, luxury, year_round, [museums, nightlife, shopping], 4).
destination(cairo, 'Cairo', 'Egypt', cultural, mid, winter, [pyramids, museums, history], 5).

cost_score(X,X,2). cost_score(_,_,0).
season_score(X,X,2). season_score(_,year_round,1). season_score(year_round,_,1). season_score(_,_,0).
type_score(X,X,2). type_score(_,_,0).
days_score(D,U,2):-D>=U. days_score(D,U,1):-D>=U-1,D<U. days_score(_,_,0).
activity_score(Acts,Prefs,S):-findall(A,(member(A,Prefs),member(A,Acts)),L),length(L,N),(N>=2->S=3;N=1->S=2;S=0).

score_dest(Cost,Season,Type,Days,Prefs,Name,Score):-
    destination(Name,_,_,T,C,S,Acts,Min),
    cost_score(Cost,C,Sc1),
    season_score(Season,S,Sc2),
    type_score(Type,T,Sc3),
    days_score(Days,Min,Sc4),
    activity_score(Acts,Prefs,Sc5), Score is Sc1+Sc2+Sc3+Sc4+Sc5.

recommend_unique(Cost,Season,Type,Days,Prefs,Results):-
    findall(Score-Place-Country,
        (destination(Name,Place,Country,_,_,_,_,_), once(score_dest(Cost,Season,Type,Days,Prefs,Name,Score))),
    Pairs),
    sort(0,@>=,Pairs,Sorted),
    findall([Place,Country,Score], member(Score-Place-Country,Sorted), Results).
