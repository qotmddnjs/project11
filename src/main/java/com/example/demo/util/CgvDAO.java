package com.example.demo.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.vo.CgvVO;

public class CgvDAO {
    // 데이터베이스 연결 객체
    private Connection conn;

    // 생성자: DatabaseUtil 클래스의 getConnection 메서드를 사용하여 데이터베이스 연결을 얻음
    public CgvDAO() {
        conn = DatabaseUtil.getConnection();
    }

    // 영화 정보를 데이터베이스에 삽입하는 메서드
    public void insert(CgvVO vo) {
        PreparedStatement pstmt = null;
        try {
            // SQL 문을 준비하여 실행
            String sql = "INSERT INTO movies (title, image, genre) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getImage());
            pstmt.setString(3, vo.getGenre());
            pstmt.executeUpdate();

            System.out.println("Inserted movie: " + vo.getTitle());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // 영화 목록 가져오기
    public List<CgvVO> getMovies() {
        List<CgvVO> movies = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT title, image, genre FROM movies";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CgvVO movie = new CgvVO();
                movie.setTitle(rs.getString("title"));
                movie.setImage(rs.getString("image"));
                movie.setGenre(rs.getString("genre"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return movies;
    }
}
