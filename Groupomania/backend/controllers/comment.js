const Comment = require("../models/comment");

exports.create = (req, res, next) => {
  // DEFINI LES CHAMPS REMPLI
  const comment = {
    content: req.body.content,
    authorId: req.body.authorId,
    postId: req.body.postId,
    username: req.body.username,
  };
  Comment.save(comment)
    .then((result) => {
      const id = result[0].insertId;
      res.status(200).json({
        id,
        ...comment,
      });
    })
    .catch((error) => {
      res.status(500).json(error);
    });
};

exports.getAll = (req, res, next) => {
  Comment.findAll(req.params.postId)
    .then((result) => {
      const comments = result[0];
      res.status(200).json(comments);
    })
    .catch((error) => {
      res.status(500).json(error);
    });
};

// exports.delete = (req, res, next) => {
//   Comment.deleteOne(req.params.id)
//     .then((comment) => {
//       if (comment.authorId !== req.auth.authorId) {
//         res.status(403).json({ error: "Requête non autorisé" });}

//     .then(() => res.status(200).json("Commentaire supprimé !") )
//     })
//     .catch((error) => {
//       res.status(500).json(error);
//     });
// };

//Delete
exports.delete = (req, res, next) => {
  Comment.findOne(req.params.id)
    .then((comment) => {
      if (comment.authorId !== req.auth.userId || user.role !== "admin") {
        res.status(403).json({ error: "Requête non autorisé" });
      }
      Comment.deleteOne(req.params.id)
        .then(() => res.status(200).json({ comment: "Comment supprimé !" }))
        .catch((error) => res.status(400).json({ error }));
    })
    .catch((error) => res.status(500).json({ error }));
};
