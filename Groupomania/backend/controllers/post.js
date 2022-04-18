// const models = require("../models");
const fs = require("fs");
const jwt = require("jsonwebtoken");
const db = require("../config/db");
const Post = require("../models/post");
const Comment = require("../models/comment");
// Afficher tous les posts

exports.getAllPosts = (req, res, next) => {
  Post.find()
    .then((result) => {
      res.status(200).json(result[0]);
    })
    .catch((error) => res.status(500).json(error));
};

// Afficher un post
exports.getOnePost = (req, res, next) => {
  Post.findOne(req.params.id)
    .then((result) => {
      const post = result[0][0];
      res.status(200).json(post);
    })
    .catch((error) => res.status(500).json(error));
};
// Créer un post

exports.createPost = (req, res, next) => {
  const imageUrl = req.file
    ? `${req.protocol}://${req.get("host")}/images/${req.file.filename}`
    : null;
  const post = JSON.parse(req.body.post);

  Post.save(post, imageUrl)
    .then((result) => {
      const id = result[0].insertId;
      res.status(200).json({
        ...post,
        id,
        imageUrl,
      });
    })
    .catch((error) => res.status(500).json(error));
};

exports.deletePost = (req, res, next) => {
  Comment.deleteByPost(req.params.id).then(() => {
    Post.deleteOne(req.params.id)
      .then(() => {
        res.status(200).json("Post supprimé !");
      })
      .catch((error) => {
        res.status(500).json(error);
      });
  });
};
