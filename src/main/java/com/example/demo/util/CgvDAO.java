package com.example.demo.util;

import com.example.demo.vo.CgvVO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CgvDAO {
    // 데이터베이스 연결 정보
    private static final String URL = "jdbc:mysql://localhost:8082/movies";
    private static final String USERNAME = "crawl_usr";
    private static final String PASSWORD = "Test001";

    // 영화 정보 삽입 쿼리
    private static final String INSERT_MOVIE = "INSERT INTO movies (title, image, genre, bookcnt) VALUES (?, ?, ?, ?)";

    public void insert(CgvVO vo) {
        try (
            // 데이터베이스 연결
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 쿼리 실행을 위한 PreparedStatement 생성
            PreparedStatement pstmt = conn.prepareStatement(INSERT_MOVIE);
        ) {
            // PreparedStatement에 영화 정보 설정
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getImage());
            pstmt.setString(3, vo.getGenre());
            pstmt.setInt(4, vo.getBookcnt());

            // 쿼리 실행
            pstmt.executeUpdate();
            System.out.println("영화 정보가 성공적으로 추가되었습니다.");
        } catch (SQLException e) {
            System.err.println("영화 정보를 추가하는 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}

