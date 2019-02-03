<template>
  <div class="col-lg-12">
<h3>Auction details</h3>
<br/>

<p> Description: {{bid.descriptions}}</p>
<hr/>
<p>{{bid.price }}</p>9
<hr/>
<p>{{bid.closing_date}}</p>
 
<br>
<div class="">
    <form id="form" @submit.prevent="processForm">
      <div class="field">
        <input type="text" class="input"  v-model="bidamount">
      </div>
      <div class="field has-text-right">
        <button type="submit" class="button is-danger">Submit</button>
      </div>
    </form>

  </div>

</div>
</template>


<style scoped>
  a {
    color: #AA9080;
    background-color: #2020AA;
  }
</style>

<script>

import axios from 'axios';

  export default {
    data () {
      return {
        item_id: this.$route.params.id,
        bid: {}
       
      }
    },
    methods: {
    //  processForm: function() {
    //   console.log({ bidamount: this.bidamount, orginalprice: this.orginalprice,itemid: this.itemid, description: this.description,time });
    //   alert('Processing!');
    },
    created() {
        this.$http.get("http://localhost:4000/api/item/"+ this.item_id)
        .then(function(data){
          console.log(data);
          this.bid = data.body
        }),
        this.$http.get("http://localhost:4000/api/item/"+ this.item_id)
        .then(function(data){
          console.log(data);
          this.bid = data.body
        })
      }
  }
</script>