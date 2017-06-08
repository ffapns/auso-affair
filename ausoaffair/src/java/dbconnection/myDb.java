/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fifap
 */
public class myDb {

    Connection con;
    private String dbURL = "jdbc:mysql://localhost:3306/ausodb";
    private String username = "root";
    private String password = "fifapns5620";

    public Connection getCon() {
        try {
            System.out.print("Find DB");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(dbURL, username, password);
            System.out.print("DB is ready");
        } catch (ClassNotFoundException ex) {
            System.out.print("Class not found" + myDb.class.getName());
            //Logger.getLogger(myDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.print("SQL ERROR" + myDb.class.getName());
//            Logger.getLogger(myDb.class.getName()).log(Level.SEVERE, null, ex);
        }

        return con;
    }
}
