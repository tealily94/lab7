package ca.sait.lab7.servlets;

import ca.sait.lab7.models.Role;
import ca.sait.lab7.models.User;
import ca.sait.lab7.services.RoleService;
import ca.sait.lab7.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author soo
 */
public class UserServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        
        try {
            List<User> users = service.getAll();       
            
            request.setAttribute("users", users);
            
           this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }     
        
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            String email = request.getParameter("email");
            try {
                boolean deleted = service.delete(email);

            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action != null && action.equals("edit")) {
            
        }
    this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        UserService service = new UserService();
        RoleService rservice = new RoleService();
        String action = request.getParameter("action");
        
        if(action != null && action.equals("Save")) {
            String email = request.getParameter("email");      
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password"); 
            String roleId = request.getParameter("roleId");
            String roleName = "";
            
            try{
             switch (roleId) {
             case "1":
                 roleName = "system admin";
                 break;
             case "2":
                 roleName = "regular user";
                 break;
             case "3":
                 roleName = "company admin";       
             }
            }catch(Exception e) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("message", "error");
            }
         
        Role role = new Role(Integer.parseInt(roleId), roleName);
        
        try{
             switch (action) {
                case "Create":
                   service.insert(email, true, firstName, lastName, password, role);
                   break;
                case "Edit":
                   service.update(email, true, firstName, lastName, password, role);
                    break;
                case "Delete":
                  service.delete(email);
            }
              request.setAttribute("message", action);
        } catch(Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        }
      getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);    
    }

}
