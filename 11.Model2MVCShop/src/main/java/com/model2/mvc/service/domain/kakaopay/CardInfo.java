package com.model2.mvc.service.domain.kakaopay;

public class CardInfo {
	private String purchase_corp;
	private String purchase_crop_code;
	private String issuer_corp;
	private String issuer_corp_code;
	private String bin;
	private String card_type;
	private String install_month;
	private String approved_id;
	private String card_mid;
	public String getPurchase_corp() {
		return purchase_corp;
	}
	public void setPurchase_corp(String purchase_corp) {
		this.purchase_corp = purchase_corp;
	}
	public String getPurchase_crop_code() {
		return purchase_crop_code;
	}
	public void setPurchase_crop_code(String purchase_crop_code) {
		this.purchase_crop_code = purchase_crop_code;
	}
	public String getIssuer_corp() {
		return issuer_corp;
	}
	public void setIssuer_corp(String issuer_corp) {
		this.issuer_corp = issuer_corp;
	}
	public String getIssuer_corp_code() {
		return issuer_corp_code;
	}
	public void setIssuer_corp_code(String issuer_corp_code) {
		this.issuer_corp_code = issuer_corp_code;
	}
	public String getBin() {
		return bin;
	}
	public void setBin(String bin) {
		this.bin = bin;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getInstall_month() {
		return install_month;
	}
	public void setInstall_month(String install_month) {
		this.install_month = install_month;
	}
	public String getApproved_id() {
		return approved_id;
	}
	public void setApproved_id(String approved_id) {
		this.approved_id = approved_id;
	}
	public String getCard_mid() {
		return card_mid;
	}
	public void setCard_mid(String card_mid) {
		this.card_mid = card_mid;
	}
	@Override
	public String toString() {
		return "CardInfo [purchase_corp=" + purchase_corp + ", purchase_crop_code=" + purchase_crop_code
				+ ", issuer_corp=" + issuer_corp + ", issuer_corp_code=" + issuer_corp_code + ", bin=" + bin
				+ ", card_type=" + card_type + ", install_month=" + install_month + ", approved_id=" + approved_id
				+ ", card_mid=" + card_mid + "]";
	}
	
	
}
