new Vue({
  el: '#app',
  data: {
    theme: 'light',
    showDropdown: false,
    selectedSite: 'Home', // Set "Home" as the initial selected site
    websites: [
      { name: "Home", content: "Welcome to the home page!" },
      { name: "Search Engine", content: "This is a search engine page." },
      { name: "News", content: "Here are some news headlines." },
      { name: "Social Media", content: "Welcome to your social media feed!" }
    ]
  },
  template: `
    <div :class="['mock-browser', theme]">
      <div class="browser-header">
        <div class="nav-button-container">
          <button class="nav-button" @click="toggleDropdown"><i class="fas fa-cog"></i></button>
          <div v-if="showDropdown" class="dropdown-menu">
            <button @click="setTheme('light')">Light Theme</button>
            <button @click="setTheme('dark')">Dark Theme</button>
          </div>
        </div>
        <!-- Home button now resets the page to Home -->
        <button class="nav-button" @click="goHome"><i class="fas fa-home"></i></button>
        <div class="address-bar">
          <select v-model="selectedSite" @change="updateContent">
            <option value="" disabled>Select a site...</option>
            <option v-for="site in websites" :value="site.name" :key="site.name">
              {{ site.name }}
            </option>
          </select>
        </div>
        <button class="exit-button" @click="closeBrowser">X</button>
      </div>
      <div class="browser-content">
        <p v-if="selectedSite">{{ currentContent }}</p>
        <p v-else>Please select a website from the dropdown above.</p>
      </div>
    </div>
  `,
  computed: {
    currentContent() {
      const site = this.websites.find(w => w.name === this.selectedSite);
      return site ? site.content : '';
    }
  },
  methods: {
    toggleDropdown() {
      this.showDropdown = !this.showDropdown;
    },
    setTheme(newTheme) {
      this.theme = newTheme;
      this.showDropdown = false;
    },
    closeBrowser() {
      alert("Browser closed!"); // Placeholder action
    },
    goHome() {
      this.selectedSite = "Home"; // Set to home page content
    },
    updateContent() {
      // This will automatically update `currentContent` due to reactivity
    }
  }
});
