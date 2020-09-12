package com.customer.service.application.web.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerDetailRepository extends JpaRepository<CustomerDetailData, String> {

	public List<CustomerDetailData> findByName(String  name);
	public void deleteByMobileNo(long mobileNo);
}
