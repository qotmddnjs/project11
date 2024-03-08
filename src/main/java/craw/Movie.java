package craw;

public class Movie {
	private String title;
	private String start;
	private String star;
	private String learning_time;
	private String content;
	private String imageUrl; // 이미지 URL 추가

	public Movie(String title,  String star, String learning_time, String content, String imageUrl) {
		this.title = title;
		
		this.star = star;
		this.learning_time = learning_time;
		this.content = content;
		this.imageUrl = imageUrl; // 이미지 URL 설정
	}

	public String getTitle() {
		return title;
	}

	public String getStart() {
		return start;
	}

	public String getStar() {
		return star;
	}

	public String getLearning_time() {
		return learning_time;
	}

	public String getContent() {
		return content;
	}

	public String getImageUrl() {
		return imageUrl; // 이미지 URL 반환
	}

	@Override
	public String toString() {
		return "Movie [title=" + title + ", start=" + start + ", star=" + star + ", learning_time=" + learning_time
				+ ", content=" + content + ", imageUrl=" + imageUrl + "]"; // 이미지 URL 포함하여 출력
	}
}
