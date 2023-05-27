fetch("http://localhost:3001/api/books").then(res => res.json()).then(books => {
    console.log("books", books);
});

fetch("http://localhost:3001/api/books?name=Азбука").then(res => res.json()).then(books => {
    console.log("books", books);
});