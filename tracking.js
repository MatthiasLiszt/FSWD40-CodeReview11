var gpsLat=51;
var gpsLng=16;

function showMap(lat,lng,key){
 //alert('working '+lat+' '+lng);
 gpsLat=lat;
 gpsLng=lng;
 
 var mapUrl="https://maps.googleapis.com/maps/api/js";
 var callback='initMap';
 var apiCall=`${mapUrl}?key=${key}&callback=${callback}`;
 //alert(apiCall);
 $('#map').text('failed');
 $.getScript(apiCall);
}

function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: gpsLat, lng: gpsLng},
          zoom: 8
        });
      }