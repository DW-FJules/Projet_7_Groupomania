<template>
  <div>
    <nav-bar></nav-bar>
    <div class="feed">
      <form @submit.prevent="addPost">
        <input
          type="text"
          v-model="content"
          placeholder="Postez quelque chose ici..."
        />
        <input class="button" type="file" @change="uploadFile" />
        <button class="button" type="submit">Publier</button>
      </form>
      <button class="button" @click="sortByDate">
        Afficher les derniers posts
      </button>
      <post
        v-for="post in posts"
        :key="post.id"
        :post="post"
        :user="user"
        @deletePost="deletePost(post.id)"
      ></post>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import NavBar from "../components/NavBar.vue";
import Post from "../components/Post.vue";
import { DateTime } from "luxon";
export default {
  name: "Feeds",
  components: {
    NavBar,
    Post,
  },
  data() {
    return {
      posts: [],
      content: "",
      file: null,
    };
  },
  mounted() {
    axios
      .get("/post/feeds")
      .then((res_post) => {
        res_post.data.forEach((post) => {
          post.date = DateTime.fromISO(post.date).toFormat("dd/MM/yyyy HH:mm");
          this.posts.push(post);
        });
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    sortByDate() {
      this.posts.sort((postA, postB) => {
        return new Date(postA.date).valueOf() - new Date(postB.date).valueOf();
      });
      this.posts.reverse();
    },
    addPost() {
      let formData = new FormData();
      formData.append("image", this.file);
      formData.append(
        "post",
        JSON.stringify({
          authorId: this.user.id,
          content: this.content,
        })
      );
      axios
        .post("/post", formData)
        .then((res) => {
          let post = res.data;
          post.date = DateTime.fromJSDate(new Date()).toFormat(
            "dd/MM/yyyy HH:mm"
          );
          this.posts.push(post);
          this.sortByDate();
        })
        .catch((error) => {
          console.log(error);
        });
    },
    uploadFile(event) {
      this.file = event.target.files[0];
    },
    deletePost(postId) {
      axios
        .delete(`/post/${postId}`)
        .then(() => {
          this.posts = this.posts.filter((post) => {
            return post.id !== postId;
          });
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  computed: {
    user() {
      return this.$store.getters["user"];
    },
  },
};
</script>

<style>
.feed {
  width: 1000px;
  height: auto;
  padding: 52px 72px 56px 62px;
  margin-top: 50px;
  border-radius: 20px;
  justify-content: center;
}
.container {
  width: 700px;
  height: auto;
  padding: 52px 72px 56px 62px;
  margin-top: 50px;
  border-radius: 20px;
  justify-content: center;
  background-color: #c9c5c5;
}
img {
  width: 200px;
}
input {
  /* display: flex; */
  margin: 0 10px 0 0;
  /* gap: 16px; */
  /* flex-wrap: wrap; */
  padding: 8px;
  border: none;
  border-radius: 8px;
  background: #f2f2f2;
  font-weight: 500;
  font-size: 16px;
  flex: 1;
  min-width: 100px;
  min-height: 100px;
  color: black;
}
form {
  display: flex;
  margin-bottom: 20px;
}
.btn {
  background: #babcbf;
  border-color: #babcbf;
  color: #fff;
  cursor: default;
  border-radius: 1.25em;
}
</style>
