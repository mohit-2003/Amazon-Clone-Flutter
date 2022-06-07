const PORT = process.env.PORT || 8080;
const DB_URL =
  "mongodb+srv://mohitbro:4XYtPce6DUaKOWaS@cluster0.k6qsy7o.mongodb.net/?retryWrites=true&w=majority";

const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const app = new express();

app.listen(PORT, function () {
  console.log("Server started.. at PORT: 8080");
});

app.use(express.json());
app.use(authRouter);

// connecting mongodb
mongoose
  .connect(DB_URL)
  .then(() => {
    console.log("Database connection successful...");
  })
  .catch((e) => {
    console.log(e);
  });
