package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns="/loginAction")//�럹�씠吏��뿉�꽌 �븸�뀡�쓣 蹂대궪 url 二쇱냼
public class LoginServlet extends HttpServlet {
	
	private LoginDAO loginDAO;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loginDAO=LoginDAO.getInstance();
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		response.setContentType("text/html;charset=utf-8");
		int result=loginDAO.login(id, password);
		System.out.println("hello");
		if(result==1){
			HttpSession session = request.getSession(false);
			session.setAttribute("id","kim");
			RequestDispatcher dispatcher = request.getRequestDispatcher("2uzubook/JSP/index.jsp");
			dispatcher.forward(request, response);
		}else{
			HttpSession session = request.getSession(true);
			session.setAttribute("id","kim2");
			RequestDispatcher dispatcher = request.getRequestDispatcher("2uzubook/JSP/index.jsp");
			dispatcher.forward(request, response);
			response.sendRedirect("/2uzubook/JSP/index.jsp");
		}
	}

}