<template>
  <div id="app">
    <div v-if="loading">Loading.</div>
    <div v-if="article" class="article-detail">
      <div class="toolbar"><router-link class="article-title" to="/articles">Back</router-link></div>
      <div class="title">{{ article.title }}</div>
      <div class="markdown-body">
        {{article.body}}
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
  export default {
    data() {
      return {
        loading: false,
        article: null,
      }
    },
    mounted() {
      this.fetchData(this.$route.params.id);
    },
    methods: {
      fetchData(id) {
        this.loading = true;
        fetch(`/api/v1/articles/${id}.json`)
          .then(res => res.json())
          .then(article => {
            this.mode = "detail";
            this.article = article;
          })
          .then(() => this.loading = false);
      },
    },
  }
</script>

<style lang='scss' scoped>
  .article-detail {
    .toolbar {
      margin-bottom: 15px;
    }
    .title {
      font-size: 18px;
      font-weight: 700;
      margin-bottom: 15px;
    }
  }
</style>