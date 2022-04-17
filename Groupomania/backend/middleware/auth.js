const jwt = require("jsonwebtoken");
const User = require("../models/user");

module.exports = async (req, res, next) => {
  try {
    // Recup le token du header Auth de la requête entrante
    const token = req.headers.authorization;

    // Decodage du token (-> objet js)
    const decodedToken = jwt.verify(token, process.env.TOKEN);

    // Recup le userId du token
    const userId = decodedToken.userId;

    const result = await User.findOne(userId);
    const user = result[0][0];
    req.auth = user;
    if (!user) {
      throw "Invalid user ID";
    } else {
      next();
    }
  } catch {
    res.status(403).json({
      error: "unauthorized request",
    });
  }
};
