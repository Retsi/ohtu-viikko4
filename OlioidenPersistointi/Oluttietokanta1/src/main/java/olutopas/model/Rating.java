/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package olutopas.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author retsi
 */
@Entity
public class Rating {
    @Id
    private Integer id;

    @ManyToOne
    private Beer beer;

    @ManyToOne
    private User user;
 
    private int arvosana;
    
    public Rating(){
        
    }
    
    public Rating(Beer olut, User kayttaja, int value){
        this.beer = olut;
        this.user = kayttaja;
        this.arvosana = value;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Beer getBeer() {
        return beer;
    }

    public void setBeer(Beer beer) {
        this.beer = beer;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getArvosana() {
        return arvosana;
    }

    public void setArvosana(int arvosana) {
        this.arvosana = arvosana;
    }

    @Override
    public String toString() {
        return user.getName() +  " " + beer.getName();
    }
    
}
