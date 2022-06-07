const jwt = require("jsonwebtoken");

const auth = (req, res, next) => {
  try {
    const token = req.header("auth-token");
    if (!token) {
      return res.status(401).json({ msg: "No auth token, access denied" });
    }
    const isVerified = jwt.verify(token, "secretKey");
    if (!isVerified) {
      return res
        .status(401)
        .json({ msg: "Token verification failed, access denied" });
    }
    req.user = isVerified.id;
    req.token = token;
    next();
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

module.exports = auth;
