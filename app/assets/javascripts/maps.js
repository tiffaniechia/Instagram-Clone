$(document).ready(function(){
  var mapElem = $('#map')


  $.get(mapElem.data('post-url'),function(post){
    console.log('hi');
    var map = new GMaps({
      div: '#map', 
      lat: post.latitude,
      lng: post.longitude
    }); 

      map.addMarker({
        lat: post.latitude,
        lng: post.longitude,
        title: post.description
      });

  });
});
