<template>
  <form @submit.prevent="$emit('addComment', content)">
    <input
      type="text"
      v-model="content"
      placeholder="Ecrivez un commentaire..."
    />
    <button class="button" type="submit">Commenter</button>
  </form>
</template>
<script>
export default {
  data() {
    return {
      content: null,
    };
  },
};
</script>
