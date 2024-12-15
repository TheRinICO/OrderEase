import App from './App'

// #ifndef VUE3
import Vue from 'vue'
import './uni.promisify.adaptor'

import request from './util/request.js'
import './static/css/global.css'
import {apiConfig} from './util/config.js'

Vue.config.productionTip = false
App.mpType = 'app'

const baseUrl = process.env.NODE_ENV === "development" ? apiConfig.dev.baseUrl : apiConfig.prod.baseUrl

Vue.prototype.$request=request
Vue.prototype.$baseUrl = baseUrl

const app = new Vue({
  ...App
})
app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif