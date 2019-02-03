// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import Vue from 'vue'
import 'vueify/lib/insert-css'
import Vuetify from 'vuetify'
import Hello from './components/hello.vue'
import World from './components/world.vue'
import Auction from './components/auction.vue'
import Bid from './components/bidhistory.vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'


Vue.use(Vuetify)
Vue.use(VueRouter)
Vue.use(VueResource)



const routes = [
  {path: '/', component: Auction},
  {path: '/my-hello', component: Hello},
  {path: '/my-world', component: World},
  {path: '/auction', component: Auction},
  {path: '/bid/:id', component: Bid, name:"bid"},

]

const router = new VueRouter({
  routes
});

const app = new Vue({
  router
}).$mount('#router-main');

// new Vue({
//   el: '#vue-playground',
//   data: {
//     message: 'Hello to Vue World!'
//   }
// });

// new Vue({
//   el: '#bidhistory',
//     components: { Bid }
// });

// new Vue({
//   el: '#auction',
//     components: { Auction }
// });

// new Vue({ 
//   el: '#main',
//   components: { Hello }
// });
