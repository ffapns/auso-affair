/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dbconnection.myDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifap
 */
public class LoginService {

    ResultSet rs;

    public ResultSet RequestLogin(String userName, String password) {
        myDb db = new myDb();
        Connection con = db.getCon();
        String SQL_QUERY = "SELECT * from user_info WHERE Username=? AND Password=?";

        try {
            PreparedStatement pst = con.prepareStatement(SQL_QUERY);
            pst.setString(1, userName);
            pst.setString(2, password);

            pst.executeQuery();
            rs = pst.getResultSet();

            return rs;
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }
}
