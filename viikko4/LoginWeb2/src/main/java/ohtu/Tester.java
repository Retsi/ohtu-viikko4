
package ohtu;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class Tester {
    public static void main(String[] args) {
        WebDriver driver = new HtmlUnitDriver();

        driver.get("http://localhost:8080");
        System.out.println( driver.getPageSource() );
        WebElement element = driver.findElement(By.linkText("login"));       
        element.click(); 
        
        System.out.println("==");
        
        System.out.println( driver.getPageSource() );
        element = driver.findElement(By.name("username"));
        element.sendKeys("pekka");
        element = driver.findElement(By.name("password"));
        element.sendKeys("akkep");
        element = driver.findElement(By.name("login"));
        element.submit();
        
        System.out.println("==");
        System.out.println( driver.getPageSource() );
        
        //OHTU HARJOITUS:
        
        System.out.println("==");
        
        element = driver.findElement(By.linkText("logout"));
        element.click();
        
        System.out.println(driver.getPageSource());
        
        //epäonnistunut kirjautuminen: oikea käyttäjätunnus, väärä salasana
        
        element = driver.findElement(By.linkText("login"));       
        element.click(); 
        
        element = driver.findElement(By.name("username"));
        element.sendKeys("pekka");
        element = driver.findElement(By.name("password"));
        element.sendKeys("aasdp");
        element = driver.findElement(By.name("login"));
        element.submit();
        System.out.println("==");
        System.out.println( driver.getPageSource() );
        
        //epäonnistunut kirjautuminen: eiolemassaoleva käyttäjätunnus
        
        element = driver.findElement(By.name("username"));
        element.clear();
        element.sendKeys("pelle");
        element = driver.findElement(By.name("password"));
        element.sendKeys("ihan sama");
        element = driver.findElement(By.name("login"));
        element.submit();
        System.out.println("==");
        System.out.println( driver.getPageSource() );
        
        //uuden käyttäjätunnuksen luominen 
        
        element = driver.findElement(By.linkText("back to home"));
        element.click();
        
        element = driver.findElement(By.linkText("register new user"));
        element.click();
        
        element = driver.findElement(By.name("username"));
        element.sendKeys("pelle");
        element = driver.findElement(By.name("password"));
        element.sendKeys("klowni1515");
        element = driver.findElement(By.name("passwordConfirmation"));
        element.sendKeys("klowni1515");
        element = driver.findElement(By.name("add"));
        element.submit();
        
        System.out.println(driver.getPageSource());
        
        element = driver.findElement(By.linkText("continue to application mainpage"));
        element.click();
        
        element = driver.findElement(By.linkText("logout"));
        element.click();
        
        //ja luodulla käyttäjätunnuksella kirjautuminen
        
        element = driver.findElement(By.linkText("login"));
        element.click();
        
        element = driver.findElement(By.name("username"));
        element.sendKeys("pelle");
        element = driver.findElement(By.name("password"));
        element.sendKeys("klowni1515");
        element = driver.findElement(By.name("login"));
        element.submit();
        
        System.out.println(driver.getPageSource());
    }
}
