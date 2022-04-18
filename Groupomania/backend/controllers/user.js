const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const db = require("../config/db");
const User = require("../models/user");
const Comment = require("../models/comment");
const Post = require("../models/post");
// Inscription

exports.signup = (req, res, next) => {
  bcrypt.hash(req.body.password, 10).then((hash) => {
    const data = {
      email: req.body.email,
      password: hash,
      prenom: req.body.prenom,
      nom: req.body.nom,
    };
    User.save(data)
      .then(() => {
        res.status(200).json("user created");
      })
      .catch((error) => res.status(500).json(error));
  });
};
// Et la fonction login pour connecter les user existants

exports.login = (req, res, next) => {
  User.findByEmail(req.body.email).then((result) => {
    const user = result[0][0];
    if (!user) {
      return res.status(401).json({ error: "Email incorrect" });
    }
    bcrypt
      .compare(req.body.password, user.password)
      .then((valid) => {
        if (!valid) {
          return res.status(401).json({ error: " Mot de passe incorrect !" });
        }
        db.execute(`INSERT INTO connection (userId) VALUES ('${user.id}')`);
        res.status(200).json({
          user: user,
          token: jwt.sign({ userId: user.id }, process.env.TOKEN, {
            expiresIn: "24h",
          }),
        });
      })
      .catch((error) =>
        res.status(500).json({ message: "Erreur authentification" })
      );
  });
};

// Supprimer le compte

exports.delete = (req, res, next) => {
  Comment.deleteByUser(req.params.id)
    .then(() => {
      Post.deleteByUser(req.params.id).then(() => {
        User.deleteOne(req.params.id).then(() => {
          res.status(200).json("utilisateur supprimé");
        });
      });
    })
    .catch((error) => res.status(500).json({ error }));
};

exports.profile = (req, res) => {
  res.status(200).json(req.auth);
};

exports.getUserById = (req, res) => {
  User.findOne(req.params.id)
    .then((result) => {
      const user = result[0][0];
      delete user.password;
      res.status(200).json(user);
    })
    .catch((error) => {
      res.status(500).json(error);
    });
};
