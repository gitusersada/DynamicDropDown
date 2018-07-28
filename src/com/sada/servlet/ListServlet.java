package com.sada.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class ListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String catagoryChoice = (String) request.getParameter("firstChoice");
		System.out.println("Inside servlet choice:"+catagoryChoice);
		try {

			Map<String, String> options = new LinkedHashMap<>();
			switch (catagoryChoice) {
			case "beverages":
				options.put("Coffee", "Coffee");
				options.put("Coke", "Coke");
				break;
			case "snacks":
				options.put("Chips", "Chips");
				options.put("Cookies", "Cookies");
				break;
			default:
				options.put("base", "Please choose from above");
				break;
			}

			String json = new Gson().toJson(options);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
