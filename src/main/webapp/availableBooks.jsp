<h2>Available Books</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Genre</th>
        <th>Status</th>
    </tr>
    <c:forEach items="${availableBooks}" var="book">
        <tr>
            <td>${book.id}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td>${book.genre}</td>
            <td>${book.status}</td>
        </tr>
    </c:forEach>
</table>