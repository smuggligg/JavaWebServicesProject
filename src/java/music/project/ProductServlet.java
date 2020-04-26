/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package music.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import music.business.Product;
import music.data.ProductIO;

/**
 *
 * @author canes
 */
public class ProductServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        doPost(request, response);
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

        String url = "/index.jsp";
        HttpSession session = request.getSession();
        String path = getServletContext().getRealPath("/WEB-INF/product.txt");
        ProductIO.init(path);

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "displayProducts";  // default action
        }

        // perform action and set URL to appropriate page
        if (action.equals("displayProducts")) {

            List<Product> products = ProductIO.selectProducts();
            session.setAttribute("products", products);

            url = "/products.jsp";

        } else if (action.equals("addProduct")) {

            url = "/addProduct.jsp";

        } else if (action.equals("add")) {

            String code = request.getParameter("productCode");
            String description = request.getParameter("productDescription");
            String stringPrice = request.getParameter("productPrice");
            String message = "";

            if (ProductIO.exists(code)) {
                message = "Product code already exists";
                session.setAttribute("message", message);
                url = "/addProduct.jsp";
            } else {
                if (code == null || code.isEmpty() || description == null || description.isEmpty() || stringPrice == null || stringPrice.isEmpty()) {
                    message = "Please fill out all three text boxes.";
                    session.setAttribute("message", message);
                    url = "/addProduct.jsp";
                } else {
                    double price = Double.parseDouble(stringPrice);

                    Product product = new Product();
                    product.setCode(code);
                    product.setDescription(description);
                    product.setPrice(price);

                    ProductIO.insertProduct(product);

                    List<Product> products = ProductIO.selectProducts();
                    session.setAttribute("products", products);
                    url = "/products.jsp";
                }
            }

        } else if (action.equals("editProduct")) {

            String code = request.getParameter("productCode");

            Product product = ProductIO.selectProduct(code);

            session.setAttribute("product", product);

            url = "/editProduct.jsp";

        } else if (action.equals("edit")) {

            String code = request.getParameter("productCode");
            String description = request.getParameter("productDescription");
            String stringPrice = request.getParameter("productPrice");
            String message = "";

            if (code == null || code.isEmpty() || description == null || description.isEmpty() || stringPrice == null || stringPrice.isEmpty()) {
                message = "Please fill out all three text boxes.";
                session.setAttribute("message", message);
                url = "/editProduct.jsp";
            } else {
                double price = Double.parseDouble(stringPrice);

                Product product = new Product();
                product.setCode(code);
                product.setDescription(description);
                product.setPrice(price);

                ProductIO.updateProduct(product);

                List<Product> products = ProductIO.selectProducts();
                session.setAttribute("product", product);
                session.setAttribute("products", products);
                url = "/products.jsp";
            }

        } else if (action.equals("deleteProduct")) {

            String code = request.getParameter("productCode");

            Product product = ProductIO.selectProduct(code);

            session.setAttribute("product", product);

            url = "/deleteProduct.jsp";

        } else if (action.equals("delete")) {

            System.out.println("Product Deleted");

            String code = request.getParameter("productCode");

            Product product = ProductIO.selectProduct(code);

            ProductIO.deleteProduct(product);

            List<Product> products = ProductIO.selectProducts();
            session.setAttribute("product", product);
            session.setAttribute("products", products);
            url = "/products.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
