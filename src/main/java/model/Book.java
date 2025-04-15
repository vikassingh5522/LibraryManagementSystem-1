package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String genre;
    private String description;
    private String isbn;
    private int publicationYear;
    private int pages;
    private double price;
    private String status;

    // Constructor
    public Book(int id, String title, String author, String genre, String description,
                String isbn, int publicationYear, int pages, double price, String status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.description = description;
        this.isbn = isbn;
        this.publicationYear = publicationYear;
        this.pages = pages;
        this.price = price;
        this.status = status;
        
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getGenre() { return genre; }
    public String getDescription() { return description; }
    public String getIsbn() { return isbn; }
    public int getPublicationYear() { return publicationYear; }
    public int getPages() { return pages; }
    public double getPrice() { return price; }
    public String getStatus() { return status; }

    // Setters for all fields to enable full updates
    public void setId(int id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setAuthor(String author) { this.author = author; }
    public void setGenre(String genre) { this.genre = genre; }
    public void setDescription(String description) { this.description = description; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
    public void setPublicationYear(int publicationYear) { this.publicationYear = publicationYear; }
    public void setPages(int pages) { this.pages = pages; }
    public void setPrice(double price) { this.price = price; }
    public void setStatus(String status) { this.status = status; }
}