<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;800&display=swap");
* {
  font-family: "Poppins", sans-serif;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
#app {
  max-width: 100%;
}
body {
  background-image: linear-gradient(62deg, #3264ee 0%, #e44444 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 32px;
}
.home_logo {
  max-width: 100%;
  border-radius: 8px;
}
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
.card__subtitle {
  text-align: center;
  color: #666;
  font-weight: 500;
}
.button {
  background: #c9c5c5;
  color: white;
  border-radius: 8px;
  font-weight: 800;
  font-size: 12px;
  border: none;
  padding: 8px;
  transition: 0.4s background-color;
}

.card__action {
  color: #2196f3;
  text-decoration: underline;
}
.card__action:hover {
  cursor: pointer;
}
.button:hover {
  cursor: pointer;
  background: linear-gradient(62deg, #3264ee 0%, #e44444 100%);
}
.button--disabled {
  background: #cecece;
  color: #ececec;
}
.button--disabled:hover {
  cursor: not-allowed;
  background: #cecece;
}

.user-infos * {
  border-radius: 20px;
  padding: 10px;
  margin: 10px 0;
  background: linear-gradient(62deg, #3264ee 0%, #e44444 100%);
  color: #ffff;
}
</style>
