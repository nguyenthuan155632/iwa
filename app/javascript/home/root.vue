<template>
  <div id="application">
    <div class="navbar">
      <router-link to="/">Home</router-link>
      <router-link to="/articles">Articles</router-link>
      <a href="/about">About</a>
    </div>
    <transition>
      <router-view></router-view>
    </transition>
  </div>
</template>

<style lang="scss" scoped>
  .navbar {
    padding: 10px;
    font-size: 14px;
    router-link {
      cursor: pointer;
      color: #1B439F;
      text-decoration: none;
      &:hover {
        color: #28289F;
      }
    }
  }
</style>