<template>
  <div class="card">
    <nav-bar></nav-bar>
    <h1 class="card__title">Espace Perso</h1>
    <h2>Mes infos</h2>
    <div class="user-infos">
      <div class="last-name">Nom : {{ user.nom }}</div>
      <div class="first-name">Prénom : {{ user.prenom }}</div>
      <div class="last-name">E-mail : {{ user.email }}</div>
      <img :src="user.photo" />
    </div>
    <button @click="logout()" class="button">Me déconnecter</button>
    <div>
      <button @click="deleteProfile" class="<red-button button">
        Supprimer mon compte
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import NavBar from "../components/NavBar.vue";
export default {
  name: "Profile",
  components: {
    NavBar,
  },
  computed: {
    user() {
      return this.$store.getters["user"];
    },
  },
  methods: {
    logout: function () {
      this.$store.commit("logout");
      this.$router.push("/");
    },
    deleteProfile() {
      axios.delete(`/user/${this.user.id}`).then(() => {
        this.logout();
      });
    },
  },
};
</script>

<style>
.card {
  max-width: 100%;
  width: 540px;
  background: white;
  border-radius: 16px;
  padding: 32px;
}
.card__title {
  text-align: center;
  font-weight: 800;
}
</style>
>
