package model;

import java.sql.Date;

public class Account {
    private String account, pass, lastName, firstName, phone;
    Date birthday;
    boolean gender, isUse;
    int roleInSystem;

    public Account() {
    }

    public Account(String account, String password) {
        this.account = account;
        this.pass = password;
        this.isUse = true;
        this.roleInSystem = 2;
        this.birthday = new Date(0);
        this.firstName = "";
        this.lastName = "";
        this.gender = true;
    }

    public Account(String account, String pass, String lastName, String firstName, Date birthday, boolean gender, String phone, boolean isUse, int roleInSystem) {
        this.account = account;
        this.pass = pass;
        this.lastName = lastName;
        this.firstName = firstName;
        this.phone = phone;
        this.birthday = birthday;
        this.gender = gender;
        this.isUse = isUse;
        this.roleInSystem = roleInSystem;
    }

    public String getAccount() {
        return account;
    }

    public String getPass() {
        return pass;
    }

    public String getLastName() {
        return lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getPhone() {
        return phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public Boolean getGender() {
        return gender;
    }

    public Boolean getIsUse() {
        return isUse;
    }

    public int getRoleInSystem() {
        return roleInSystem;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public void setIsUse(Boolean isUse) {
        this.isUse = isUse;
    }

    public void setRoleInSystem(int roleInSystem) {
        this.roleInSystem = roleInSystem;
    }
}
