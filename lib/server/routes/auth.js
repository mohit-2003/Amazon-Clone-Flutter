const express = require("express");
const User = require("../models/user");

const bcrypt = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

// signup
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const userExist = await User.findOne({ email: email });
    if (userExist)
      return res
        .status(400)
        .json({ msg: "User with same email is already exist!" });

    var salt = bcrypt.genSaltSync(10);
    var hash = bcrypt.hashSync(password, salt);

    let user = new User({
      email: email,
      password: hash,
      name: name,
    });
    user = await user.save();

    return res.json(user);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

// login
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const userExist = await User.findOne({ email: email });
    if (!userExist)
      return res
        .status(400)
        .json({ msg: "User with this email is not exist!" });

    const isMatch = await bcrypt.compare(password, userExist.password);
    if (!isMatch) {
      return res.status(400).json("incorrect password");
    }
    const token = jwt.sign({ id: userExist.id }, "secretKey");

    console.log(userExist._doc);
    return res.json({ token, ...userExist._doc });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

// verifying token
authRouter.post("/isTokenValid", async (req, res) => {
  try {
    const token = req.header("auth-token");

    if (!token) {
      return res.json(false);
    }
    const isVerified = jwt.verify(token, "secretKey");

    if (!isVerified) {
      return res.json(false);
    }
    const user = await User.findById(isVerified.id);

    if (!user) {
      return res.json(false);
    }
    return res.json(true);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

// getting user data
authRouter.get("/", auth, async (req, res, next) => {
  try {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
