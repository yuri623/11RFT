package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDAO {
	
	public Purchase findPurchase(int tranNo) throws Exception ;
	
	public Purchase findPurchase2(int prodNo) throws Exception;
	
	public List<Purchase> getPurchaseList(Search search, String buyerId)throws Exception;
	
	public Map<String, Object> getSaleList(Search vo) throws Exception;
	
	public void insertPurchase(Purchase vo) throws Exception;
	
	public void updatePurchase(Purchase vo) throws Exception;
	
	public void updateTranCode(Purchase vo) throws Exception ;
	
	public void addOpinion(String text) throws Exception;
	
	public int getTotalCount(String buyerId) throws Exception;

}
