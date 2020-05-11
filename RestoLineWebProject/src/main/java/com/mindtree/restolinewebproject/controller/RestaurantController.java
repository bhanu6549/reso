package com.mindtree.restolinewebproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mindtree.restolinewebproject.Exception.RestoLineWebProjectException;
import com.mindtree.restolinewebproject.dto.ResponseBodys;
import com.mindtree.restolinewebproject.entity.Restaurant;
import com.mindtree.restolinewebproject.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;

	@ResponseBody
	@PostMapping("/addRestaurant")
	public ResponseEntity<?> addRestaurant(@RequestBody Restaurant restaurant) throws RestoLineWebProjectException {
		return new ResponseEntity<ResponseBodys<Restaurant>>(new ResponseBodys<Restaurant>(
				restaurantService.addRestaurant(restaurant), null, "Resturant Added", true), HttpStatus.OK);
	}
	
	
	
	@RequestMapping("/restaurants")
	public String getAllRestaurant(Model model) {
		model.addAttribute("restaurantlist", restaurantService.getAllRestaurant());
		return "show-restaurants-page";
	}
	@RequestMapping("/bookhotel")
	public String bookHotel(Model model)
	{
		model.addAttribute(model);
		return "/restaurants";
	}

}
