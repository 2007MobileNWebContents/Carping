package com.carping.spring.area.store;

import java.util.ArrayList;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

public interface AreaStore {
	 public Area selectAreaInfo(String areaName);
	 public Place selectPlaceInfo(int placeKey);
	 public FoodZone selectFoodZoneInfo(int FoodZoneKey);
	 public ArrayList<AreaReview> selectAreaReviewList(int areaKey);
	 public double selectAreaReviewScoreAvg(int areaKey);
	 public int insertArea(Area area);
	 public ArrayList<Area> selectAreaList();
	 public ArrayList<FoodZone> selectFoodZoneList(String areaAddress);
	 public ArrayList<Place> selectPlaceList(String areaAddress);
}
 