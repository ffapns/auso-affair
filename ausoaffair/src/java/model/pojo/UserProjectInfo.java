/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.pojo;

/**
 *
 * @author fifap
 */
public class UserProjectInfo {

    private String id;
    private String projectTitle;
    private String projectStatus;
    
    public UserProjectInfo(){};

     public UserProjectInfo(String id, String proejectTitle, String projectStatus) {
        this.id = id;
        this.projectTitle = proejectTitle;
        this.projectStatus = projectStatus;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProejectTitle() {
        return projectTitle;
    }

    public void setProejectTitle(String proejectTitle) {
        this.projectTitle = proejectTitle;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

   
    
   
}
