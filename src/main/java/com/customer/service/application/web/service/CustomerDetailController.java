package com.customer.service.application.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CustomerDetailController {
	
	@Autowired
	private CustomerDetailService detailService;

	@RequestMapping("/customers")
	public @ResponseBody List<CustomerDetailData> getAllCustomer(){
		
		return detailService.displayDetails();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/customer", produces = "application/json" )
	public void addNewCustomer(@RequestBody CustomerDetailData data) {
		detailService.addCustomer(data);
		
	}
	
	@RequestMapping(method = RequestMethod.DELETE, value = "/customer/{cusName}/{mobNo}")
	public void deleteCustomerDetails(@PathVariable String cusName, @PathVariable long mobNo ) {
		detailService.deleteCustomer(cusName, mobNo);
		
	}
	
	@RequestMapping(method = RequestMethod.PUT, value = "/customer/{cusName}/{mobNo}")
	public void updateCustomerDetails(@RequestBody CustomerDetailData data) {
		detailService.updateCustomer(data);
	}
	
	@RequestMapping("/index")
	public ModelAndView first() {
		return new ModelAndView("index");
	}
}
