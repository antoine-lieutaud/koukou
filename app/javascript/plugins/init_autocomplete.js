import places from 'places.js';

const initAutocomplete = () => {
  const arrivalInput = document.getElementById('travel_arrival');
  if (arrivalInput) {
    places({ container: arrivalInput });
  }
  const departureInput = document.getElementById('travel_departure');
  if (departureInput) {
    places({ container: departureInput });
  }
};

export { initAutocomplete };