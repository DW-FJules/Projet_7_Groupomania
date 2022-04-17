const db = require("../config/db");

class Post {
  static save(post, imageUrl) {
    let sql = `INSERT INTO post (content, imageUrl, authorId) VALUES ('${
      post.content
    }', ${imageUrl ? `'${imageUrl}'` : imageUrl}, '${post.authorId}');`;
    return db.execute(sql);
  }

  static findOne(id) {
    let sql = `SELECT * FROM post WHERE id='${id}'`;
    return db.execute(sql);
  }
  static deleteOne(id) {
    let sql = `DELETE FROM post WHERE id='${id}'`;
    return db.execute(sql);
  }
  static find() {
    let sql = "SELECT * FROM post";
    return db.execute(sql);
  }
  static deleteByUser(authorId) {
    let sql = `DELETE FROM post WHERE authorId = '${authorId}'`;
    return db.execute(sql);
  }
}

module.exports = Post;
