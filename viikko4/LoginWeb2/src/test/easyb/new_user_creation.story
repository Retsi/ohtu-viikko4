import ohtu.*
import ohtu.authentication.*
import org.openqa.selenium.*
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

description """A new user account can be created 
              if a proper unused username 
              and a proper password are given"""

scenario "creation succesfull with correct username and password", {
    given 'command new user is selected', {
       driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("register new user"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("intiaani");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hi4watha");
      element = driver.findElement(By.name("passwordConfirmation"));
      element.sendKeys("hi4watha");
      element = driver.findElement(By.name("add"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu App!").shouldBe true
    }
}

scenario "can login with succesfully generated account", {
    given 'command login is selected', {
        driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("login"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("intiaani");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hi4watha");
      element = driver.findElement(By.name("login"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe true
    }
}

scenario "creation fails with correct username and too short password", {
    given 'command new user is selected', {
       driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("register new user"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("intiaani2");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hi4");
      element = driver.findElement(By.name("passwordConfirmation"));
      element.sendKeys("hi4");
      element = driver.findElement(By.name("add"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe false
    }
}

scenario "creation fails with correct username and pasword consisting of letters", {
    given 'command new user is selected', {
       driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("register new user"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("intiaani3");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hiasdasdasdasd");
      element = driver.findElement(By.name("passwordConfirmation"));
      element.sendKeys("hiasdasdasdasd");
      element = driver.findElement(By.name("add"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe false
    }
}

scenario "creation fails with too short username and valid pasword", {
    given 'command new user is selected', {
       driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("register new user"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("in");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hiasdasdasdasd");
      element = driver.findElement(By.name("passwordConfirmation"));
      element.sendKeys("hiasdasdasdasd");
      element = driver.findElement(By.name("add"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe false
    }
}

scenario "creation fails with already taken username and valid pasword", {
    given 'command new user is selected', {
       driver = new HtmlUnitDriver();
       driver.get("http://localhost:8080");
       element = driver.findElement(By.linkText("register new user"));       
       element.click(); 
    }
 
    when 'a valid username and password are entered', {
      element = driver.findElement(By.name("username"));
      element.sendKeys("pekka");
      element = driver.findElement(By.name("password"));
      element.sendKeys("hiasdasdasdasd1");
      element = driver.findElement(By.name("passwordConfirmation"));
      element.sendKeys("hiasdasdasdasd1");
      element = driver.findElement(By.name("add"));
      element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe false
    }
}

scenario "can not login with account that is not succesfully created", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8080");
        element = driver.findElement(By.linkText("login"));       
        element.click();  
    }
    when 'a invalid username and incorrect password are given',{
        element = driver.findElement(By.name("username"));
        element.sendKeys("intiaani3");
        element = driver.findElement(By.name("password"));
        element.sendKeys("hiasdasdasdasd");
        element = driver.findElement(By.name("login"));
        element.submit();
    }
    then 'user will not be logged in to system', {
        driver.getPageSource().contains("wrong username or password").shouldBe true
    }
}
