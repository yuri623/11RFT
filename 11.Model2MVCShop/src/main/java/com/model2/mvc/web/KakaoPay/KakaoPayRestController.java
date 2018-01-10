package com.model2.mvc.web.KakaoPay;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.kakaopay.KakaoPayRequest;
import com.model2.mvc.service.domain.kakaopay.KakaoPayResponse;

@RestController
@RequestMapping("/kakaoPay/*")
public class KakaoPayRestController {

}
