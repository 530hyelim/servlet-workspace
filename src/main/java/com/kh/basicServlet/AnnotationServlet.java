package com.kh.basicServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어노테이션으로 servlet 등록(url 패턴 제시)
@WebServlet("/second") // 매핑 역할을 대신 해줌
//@WebServlet(urlPatterns = {"/second","/second.do","/*.kh"})
// * 와일드카드 옵션. 대부분의 서블릿은 1대1 대응이 일반적. 여러개 처리할 수도 있다.
public class AnnotationServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("annotation servlet 호출!");
	}
}
