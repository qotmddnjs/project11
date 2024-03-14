package com.example.demo.util;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class MovieCrawl {	
	public static void crawl() {
	    // 크롬 드라이버 경로 설정 (크롬 드라이버 설치 필요)
	    System.setProperty("webdriver.chrome.driver", "C:\\Users\\admin\\Desktop\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");

	    // 크롬 옵션 설정
	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless"); // 브라우저를 표시하지 않고 실행할 경우

	    // 웹 드라이버 초기화
	    WebDriver driver = new ChromeDriver(options);

	    try {
	        // 크롤링할 웹 페이지 URL
	        String url = "https://www.kobis.or.kr/kobis/business/mast/thea/findTheaterSchedule.do";
	        // 웹 페이지 열기
	        driver.get(url);

	        // 광역, 기초, 영화상영관의 이름을 가져옴
	        List<WebElement> areas = driver.findElements(By.cssSelector("div[class^='fl step'] strong"));
	        for (WebElement area : areas) {
	            String areaName = area.getText();
	            System.out.println("Area: " + areaName);
	            //ddddd
	            List<WebElement> areaslist = driver.findElements(By.cssSelector("div[class^='fl step'] li"));
		        for (WebElement arealist : areaslist) {
		            String arealistName = arealist.getText();
		            System.out.println("Arealist: " + arealistName);
	            // 해당 영역의 영화상영관 이름과 영화 스케줄을 가져옴
	            List<WebElement> theaters = area.findElements(By.xpath("./following-sibling::div[@class='ovf step4 on']/ul[@id='schedule']/li"));
	            for (WebElement theater : theaters) {
	                String theaterName = theater.findElement(By.cssSelector("span.screen")).getText();
	                System.out.println("Theater: " + theaterName);
	                // 영화 스케줄
	                List<WebElement> movieSchedules = theater.findElements(By.xpath("./div[@class='times']/input[@type='radio']/following-sibling::label"));
	                for (WebElement schedule : movieSchedules) {
	                    String movieTime = schedule.getText();
	                    System.out.println("Time: " + movieTime);	                }
	            }
	        }
	    } 
	    }catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 웹 드라이버 종료
	        driver.quit();
	    }
	}
}
