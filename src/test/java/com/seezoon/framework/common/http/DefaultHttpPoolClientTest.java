package com.seezoon.framework.common.http;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.apache.http.client.ClientProtocolException;
import org.junit.Test;

public class DefaultHttpPoolClientTest {

	@Test
	public void t1() throws ClientProtocolException, IOException {
		final Map<String, String> params = new HashMap<String, String>();
		params.put("grant_type", "client_credential");
		params.put("appid", "APPID");
		params.put("secret", "APPSECRET");
	//	String doGet = HttpRequestUtils.doPost("https://api.weixin.qq.com/cgi-bin/token", params);
	//	System.out.println(doGet);
		System.in.read();
		}
}