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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.pojo.*;

/**
 *
 * @author fifap
 */
public class ProjectService {

    List<UserProjectInfo> projectList;

    public ProjectService() {
        projectList = new ArrayList<>();
    }

    public List<UserProjectInfo> GetProjectByUsername(String userName) {
        myDb db = new myDb();
        Connection con = db.getCon();
        String SQL_QUERY = "SELECT *"
                            + "from project_info join user_project on project_info.Project_ID = user_project.Project_ID "
                            + "WHERE user_project.Username = ?";

        try {
            PreparedStatement pst = con.prepareStatement(SQL_QUERY);
            pst.setString(1, userName);

            pst.executeQuery();
            ResultSet rs = pst.getResultSet();

            while (rs.next()) {
                String projectId = rs.getString("Project_ID");
                String projectTitle = rs.getString("Project_Title");
                String projectStatus = rs.getString("Status");
                System.out.print(projectId+projectTitle+projectStatus);
                UserProjectInfo upi = new UserProjectInfo();
                upi.setId(projectId);
                upi.setProejectTitle(projectTitle);
                upi.setProjectStatus(projectStatus);

                projectList.add(upi);

            }

            return this.projectList;

        } catch (SQLException ex) {
            Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return this.projectList;
    }

}
