package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDAO;
import com.model2.mvc.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDAOImpl")
	private ProductDAO dao;
	
	public ProductServiceImpl() {
		dao = new ProductDAOImpl();
	}
	
	public void addProduct(Product product) throws Exception {
		dao.insertProduct(product);
	}

	public Product getProduct(int prodNo) throws Exception {
		return dao.findProduct(prodNo);
	}

	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = dao.getProductList(search);
		int totalCount = dao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(search.getCurrentPage());
		System.out.println(search.getPageSize());
		System.out.println("service "+list.size());
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateProduct(Product product) throws Exception {
		dao.updateProduct(product);
	}

}
