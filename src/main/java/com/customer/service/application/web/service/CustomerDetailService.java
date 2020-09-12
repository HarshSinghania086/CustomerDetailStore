package com.customer.service.application.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerDetailService {

	@Autowired
	private CustomerDetailRepository customerRepo;

	public List<CustomerDetailData> displayDetails() {
		return customerRepo.findAll();
	}

	public void addCustomer(CustomerDetailData data) {
		customerRepo.save(data);

	}

	public void deleteCustomer(String cusName, long mobNo) {
		List<CustomerDetailData> listDataByName = customerRepo.findByName(cusName);
		for(int i = 0; i< listDataByName.size(); i++) 
			if(listDataByName.get(i).getMobileNo() == mobNo)
				customerRepo.delete(listDataByName.get(i));
	}

	public void updateCustomer(CustomerDetailData data) {
		customerRepo.save(data);
		
	}

}
