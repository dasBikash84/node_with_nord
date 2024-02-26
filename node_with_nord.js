const { createServer } = require("http");

// it is a good practice to always allow to
// run on a different port
const PORT = process.env.PORT || 3333;

const server = createServer();

server.listen(PORT, () => {
  console.log(`starting server at port ${PORT}`);
});