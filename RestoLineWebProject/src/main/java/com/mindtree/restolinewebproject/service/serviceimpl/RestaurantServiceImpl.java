package com.mindtree.restolinewebproject.service.serviceimpl;

import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindtree.restolinewebproject.Exception.service.RestoLineWebProjectServiceException;
import com.mindtree.restolinewebproject.Exception.service.cutom.RestuarntAlreadyExistsException;
import com.mindtree.restolinewebproject.entity.Restaurant;
import com.mindtree.restolinewebproject.repository.RestaurantRespository;
import com.mindtree.restolinewebproject.service.RestaurantService;

@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantRespository restaurantRespository;

	@Override
	public Restaurant addRestaurant(Restaurant restaurant) throws RestoLineWebProjectServiceException {

		if (restaurantRespository.findByRestaurantName(restaurant.getRestaurantName()).isPresent())
			throw new RestuarntAlreadyExistsException("Restuarnt Already Exits");

		return restaurantRespository.save(restaurant);

	}

	@Override
	public Set<Restaurant> getAllRestaurant() {

		return new TreeSet<Restaurant>(restaurantRespository.findAll());
	}

}
