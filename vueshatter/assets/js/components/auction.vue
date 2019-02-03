<template>
  <div class="col-lg-12">

<table class="table">
  <thead>
    <tr>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>
   <tr v-for="auction in auctions" :key="auction.id">
    <td>{{auction.descriptions}}</td>
    <td>{{auction.price}}</td>
    <td>{{auction.closing_date}}</td>
    
    <td>
       <router-link :to="{ name: 'bid', params: { id: auction.id }}" class="btn btn-default btn-xs">Select</router-link>
      <!-- <a v-bind:href='/item/'  class="btn btn-default btn-xs">Select</a> -->
    </td>
  </tr>

  </tbody>
</table>
</div>
</template>

<script>



  export default {
    data () {
      return {
        auctions: []
      }
    },
    methods: {
      
      },
      created() {
        this.$http.get("http://localhost:4000/api/auction")
        .then(function(data){
          console.log(data);
          this.auctions = data.body
        })
      }
    }
  
</script>