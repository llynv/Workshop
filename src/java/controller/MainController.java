package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.dao.AccountDAO;

@WebServlet(name = "mainController", urlPatterns = { "/main_controller" })
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
            return;
        }
        switch (action) {
            case "login":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.setAttribute("user", null);
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
                break;
            case "register":
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case "profile":
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
                break;    
        }
    }

    private void profile (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO(request.getServletContext());
        Account user = (Account) session.getAttribute("user");
        String password = request.getParameter("pass");
        Date dob = Date.valueOf(request.getParameter("birthday"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        boolean gender = user.getGender();
        try {
            gender = Boolean.parseBoolean(request.getParameter("gender"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String phone = request.getParameter("phone");
        user.setPass(password);
        user.setBirthday(dob);
        user.setGender(gender);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhone(phone);
        accountDAO.updateRec(user);
        session.setAttribute("user", user);        
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("new-username");
        String password = request.getParameter("new-password");
        String repeatPassword = request.getParameter("repeat-password");

        AccountDAO accountDAO = new AccountDAO(request.getServletContext());
        if (accountDAO.getObjectById(username) != null) {
            request.setAttribute("errorMessage", "Username already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (!password.equals(repeatPassword)) {
            request.setAttribute("errorMessage", "Password and repeat password do not match");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            Account account = new Account(username, password);
            accountDAO.insertRec(account);
            response.sendRedirect("/main_controller?action=login");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDAO accountDAO = new AccountDAO(request.getServletContext());
        Account authenticateAccount = authenticate(username, password, accountDAO);
        if (authenticateAccount != null && authenticateAccount.getIsUse()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", authenticateAccount);
            session.setAttribute("role", authenticateAccount.getRoleInSystem());
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
        } else if (authenticateAccount != null && !authenticateAccount.getIsUse()) {
            request.setAttribute("errorMessage", "Account is deactivated");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private Account authenticate(String username, String password, AccountDAO accountDAO) {
        Account account = accountDAO.getObjectById(username);
        if (account != null && account.getPass().equals(password)) {
            return account;
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "profile":
                profile(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
