<template>
  <div class="container">
    <div class="post-container">
      <div
        class="delete-post"
        v-if="user.id === post.authorId || user.role === 'admin'"
      >
        <button class="button" @click="$emit('deletePost')">x</button>
      </div>
      <div class="user-infos">
        <span>{{ userPost.prenom }} {{ userPost.nom }} :</span>
      </div>
      <div class="post-content">
        <!-- doit contenir le post -->
        {{ post.content }}
        <img :src="post.imageUrl" v-if="post.imageUrl" />
        <div class="timestamp">Posté le {{ post.date }}</div>
      </div>
    </div>
    <div class="post-container">
      <div v-for="comment in comments" :key="comment.id">
        <div class="comment">
          {{ comment.username }} : {{ comment.content }}
          <button
            class="button"
            v-if="user.id === comment.authorId || user.role === 'admin'"
            @click="deleteComment(comment)"
          >
            x
          </button>
        </div>
      </div>
      <comment-form @addComment="addComment($event)"></comment-form>
    </div>
  </div>
</template>
<script>
import CommentForm from "./CommentForm.vue";
import axios from "axios";

export default {
  components: {
    CommentForm,
  },
  data() {
    return {
      userPost: {
        id: null,
        prenom: null,
        nom: null,
      },
      comments: [],
    };
  },
  props: {
    post: {
      type: Object,
      required: true,
    },
    user: {
      type: Object,
      required: true,
    },
  },
  mounted() {
    axios
      .get(`/user/${this.post.authorId}`)
      .then((res_user) => {
        this.userPost = res_user.data;
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get("/comment/" + this.post.id)
      .then((res_comment) => {
        this.comments = res_comment.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    deleteComment(comment) {
      axios.delete(`/comment/${comment.id}`).then(() => {
        this.comments = this.comments.filter((comment_existed) => {
          return comment_existed.id !== comment.id;
        });
      });
    },
    addComment(content) {
      axios
        .post("/comment", {
          authorId: this.user.id,
          postId: this.post.id,
          content: content,
          username: `${this.user.prenom} ${this.user.nom}`,
        })
        .then((res) => {
          this.comments.push(res.data);
        });
    },
  },
};
</script>
<style>
.post-container {
  width: 400px;
  height: auto;
  padding: 10px;
  margin: 10px 0;
  border-radius: 20px;
  background-color: #ffff;
  position: relative;
}
.post-content {
  margin: 10px;
}
.comment {
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-radius: 20px;
  background-color: #c9c5c5;
  padding: 5px;
  margin: 5px;
  font-size: 0.8em;
}
.timestamp {
  font-size: 0.8em;
}

.delete-post {
  position: absolute;
  right: 10px;
}
</style>
