package DAO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Book;

public class BookDAO {
    // Using a regular HashMap to allow modifications
    private static Map<Integer, Book> books = new HashMap<>();
    private static int nextId = 6;

    static {
        // Initialize with some sample books
        books.put(1, new Book(1, "The Silent Patient", "Alex Michaelides", "Psychological Thriller",
                "A woman shoots her husband and then never speaks another word...",
                "978-1250301697", 2019, 336, 12.99, "Available"));
        
        books.put(2, new Book(2, "Atomic Habits", "James Clear", "Self-Help",
                "Tiny Changes, Remarkable Results: An Easy & Proven Way to Build Good Habits & Break Bad Ones",
                "978-0735211292", 2018, 320, 14.99, "Available"));
        
        books.put(3, new Book(3, "The Midnight Library", "Matt Haig", "Fantasy Fiction",
                "Between life and death there is a library, and within that library, the shelves go on forever...",
                "978-0525559474", 2020, 304, 13.99, "Available"));
        
        books.put(4, new Book(4, "Dune", "Frank Herbert", "Science Fiction",
                "Set in the distant future amidst a feudal interstellar society...",
                "978-0441172719", 1965, 412, 9.99, "Limited"));
        
        books.put(5, new Book(5, "Where the Crawdads Sing", "Delia Owens", "Mystery",
                "For years, rumors of the 'Marsh Girl' have haunted Barkley Cove...",
                "978-0735219090", 2018, 384, 12.99, "Available"));
    }

    // Basic getters
    public static Book getBookById(int id) {
        return books.get(id);
    }

    public static List<Book> getAllBooks() {
        return new ArrayList<>(books.values());
    }

    public static List<Book> getAvailableBooks() {
        List<Book> available = new ArrayList<>();
        for (Book book : books.values()) {
            if ("Available".equals(book.getStatus())) {
                available.add(book);
            }
        }
        return available;
    }

    // Book operations
    public static boolean borrowBook(int bookId) {
        Book book = books.get(bookId);
        if (book != null && "Available".equals(book.getStatus())) {
            book.setStatus("Checked Out");
            return true;
        }
        return false;
    }

    public static boolean returnBook(int bookId) {
        Book book = books.get(bookId);
        if (book != null && "Checked Out".equals(book.getStatus())) {
            book.setStatus("Available");
            return true;
        }
        return false;
    }

    // CRUD Operations
    public static int getNextId() {
        return nextId++;
    }

    public static boolean addBook(Book book) {
        if (book == null || books.containsKey(book.getId())) {
            return false;
        }
        books.put(book.getId(), book);
        return true;
    }

    public static boolean updateBook(Book updatedBook) {
        if (updatedBook == null || !books.containsKey(updatedBook.getId())) {
            return false;
        }
        books.put(updatedBook.getId(), updatedBook);
        return true;
    }

    public static boolean deleteBook(int id) {
        if (!books.containsKey(id)) {
            return false;
        }
        books.remove(id);
        return true;
    }

    // Additional methods
    public static List<Book> getCheckedOutBooks() {
        List<Book> checkedOut = new ArrayList<>();
        for (Book book : books.values()) {
            if ("Checked Out".equals(book.getStatus())) {
                checkedOut.add(book);
            }
        }
        return checkedOut;
    }

    public static List<Book> getLimitedAvailabilityBooks() {
        List<Book> limited = new ArrayList<>();
        for (Book book : books.values()) {
            if ("Limited".equals(book.getStatus())) {
                limited.add(book);
            }
        }
        return limited;
    }
}