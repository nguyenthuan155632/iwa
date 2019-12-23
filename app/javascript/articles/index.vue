<template>
  <div id="app">
    <p v-if="loading">Loading...</p>
    <div class="articles">
      <div class="article" v-for="(item, _) in articles">
        <router-link class="article-title" v-bind:to="'/articles/' + item.id">{{ item.title }}</router-link>
      </div>
      <scroll-loader :loader-method="getArticleList" :loader-disable="disable"></scroll-loader>
    </div>
  </div>
</template>

<script type="text/javascript">
  import Vue from 'vue/dist/vue.js'
  import ScrollLoader from 'vue-scroll-loader'

  Vue.use(ScrollLoader);

  export default {
    data() {
      return {
        disable: false,
        page: 1,
        pageSize: 10,
        loading: false,
        articles: [],
      }
    },
    mounted() {
      // this.fetchData();
    },
    methods: {
      // fetchData() {
      //   this.loading = true;
      //   fetch("/api/v1/articles.json")
      //     .then(res => res.json())
      //     .then(articles => {
      //       this.articles = articles;
      //     })
      //     .then(() => this.loading = false);
      // },
      getArticleList() {
        fetch("/api/v1/articles.json")
          .then(res => res.json())
          .then(res => {
            this.articles = [...this.articles, ...res.data];
            this.disable = res.data.length < this.pageSize
          })
          .then(() => this.loading = false);
      }
    },
  }
</script>

<style lang='scss' scoped>
  .articles {
    padding: 20px;
    .article {
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #e0e0e0;
      a { color: #333; text-decoration: none; }
    }
  }
</style>