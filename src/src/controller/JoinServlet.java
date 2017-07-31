package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDAO;
import user.Account;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/JoinAction")
public class JoinServlet extends HttpServlet {
	
	private JoinDAO joinDAO;
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		joinDAO=JoinDAO.getInstance();

		request.setCharacterEncoding("euc-kr");
		
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		String email = request.getParameter("email");
		
		int result=joinDAO.join(new Account(student_id,id,password,name,gender,major,email));
		
		if(result==0){
			response.sendRedirect("/main.jsp");
		}else{
			response.sendRedirect("/back.jsp");
		}
	}

}
