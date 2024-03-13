//package craw;
//
//import java.io.FileWriter;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//
//public class CrawlingTest {
//
//    public static void main(String[] args) {
//        // 1. WebDriver와 ChromeDriver 설정
//        System.setProperty("webdriver.chrome.driver", "C:\\Users\\admin\\Desktop\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
//        WebDriver driver = new ChromeDriver();
//
//        // 2. 웹 페이지 접속
//        String baseUrl = "https://www.kobis.or.kr/kobis/business/main/main.do";
//        driver.get(baseUrl);
//
//        // 3. 데이터 추출
//        ArrayList<Movie> movie_data = new ArrayList<>();
//
//        try {
//            WebElement movie_container = driver.findElement(By.cssSelector("#realBoxOffice")); // 변경된 클래스 이름 사용
//            List<WebElement> movie_links = movie_container.findElements(By.cssSelector("div.ovf > a")); // 변경된 클래스 이름 사용
//
//            for (int i = 0; i < movie_links.size(); i++) {
//                String link = movie_links.get(i).getAttribute("href");
//                driver.get(link);
//
//                // 영화 정보 추출
//                String title = driver.findElement(By.cssSelector(".ellip")).getText(); // 변경된 클래스 이름 사용
//                
//                String content = driver.findElement(By.cssSelector("movieDate")).getText(); // 변경된 클래스 이름 사용
//
//                // 이미지 URL 추출
//                WebElement movie_image = driver.findElement(By.cssSelector(".thumb > src")); // 변경된 클래스 이름 사용
//                String image_url = movie_image.getAttribute("src");
//
//                // 영화 정보 출력
//                System.out.println((i + 1) + ". " + title + " (" + content + ")");
//                System.out.println("   Image URL: " + image_url);
//
//                // 영화 객체 생성 및 리스트에 추가
//                Movie movie = new Movie(title, content, image_url);
//                movie_data.add(movie);
//
//                // 이미지 URL을 파일에 저장
//                try {
//                    FileWriter writer = new FileWriter("C:\\work\\sts-4.21.0.RELEASE-workspace\\demo\\image_urls.txt", true);
//                    writer.write(image_url + "\n");
//                    writer.close();
//                    System.out.println("이미지 URL이 파일에 저장되었습니다.");
//                } catch (IOException e) {
//                    System.out.println("파일에 이미지 URL을 저장하는 동안 오류가 발생했습니다: " + e.getMessage());
//                }
//
//                // 콘솔에 영화 정보 출력
//                System.out.println("영화 정보:");
//                System.out.println("제목: " + title);
//              
//                System.out.println("내용: " + content);
//
//                driver.navigate().back();
//            }
//        } catch (org.openqa.selenium.NoSuchElementException e) {
//            // NoSuchElementException이 발생한 경우 처리할 코드 작성
//            System.out.println("영화 정보를 가져오는 중에 오류가 발생했습니다: " + e.getMessage());
//        }
//
//        // 4. WebDriver 종료
//        driver.quit();
//    }
//}
