function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var gymAddress = document.getElementById('gym_address');

    if (gymAddress) {
      var autocomplete = new google.maps.places.Autocomplete(gymAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(gymAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
