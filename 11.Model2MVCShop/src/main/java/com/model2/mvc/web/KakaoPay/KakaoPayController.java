package com.model2.mvc.web.KakaoPay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model2.mvc.service.domain.kakaopay.KakaoPayRequest;

@Controller
@RequestMapping("/kakaoPay/*")
public class KakaoPayController {
	
	@RequestMapping(value="readyPay", method=RequestMethod.POST)
	public static String readyPay(@ModelAttribute("kakaoPayRequest") KakaoPayRequest kakaoPayRequest) throws Exception {
			
			return "redirect:"+KakaoPayTest.readyPay(kakaoPayRequest).getNext_redirect_pc_url();
	}
}
