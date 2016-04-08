/**
 * 
 */
package com.isales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yogi
 *
 */
@Controller
public class LoginController {
	@RequestMapping(value = "/login")
	public String login() {
		try{
			System.out.println("in controller...");
		}catch(Exception e){
			
		}
		return "login";
	}
}
