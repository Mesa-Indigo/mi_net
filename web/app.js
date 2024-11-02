Vue.component('Home', {
    template: `<div class="home">Welcome to the Home Page</div>`
});

Vue.component('News', {
    template: `<div class="news">Latest News: Breaking news goes here!</div>`
});

Vue.component('Social', {
    template: `<div class="social">Connect with your friends on Social!</div>`
});

new Vue({
    el: '#app',
    data: {
        isDarkMode: false,
        currentPage: 'home'
    },
    computed: {
        currentPageComponent() {
            return this.currentPage.charAt(0).toUpperCase() + this.currentPage.slice(1);
        }
    },
    methods: {
        loadPage(page) {
            this.currentPage = page;
        },
        toggleTheme() {
            this.isDarkMode = !this.isDarkMode;
            document.body.classList.toggle('dark-mode', this.isDarkMode);
            document.body.classList.toggle('light-mode', !this.isDarkMode);
        }
    },
    mounted() {
        // Set default theme
        this.toggleTheme();
    }
});
