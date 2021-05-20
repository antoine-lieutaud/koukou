import parallax from 'jquery-parallax.js';
import $ from 'jquery';

const initparallax = () => {
  $('.parallax-window').parallax({ imageSrc: '/home/hugo/code/antoine-lieutaud/koukou/app/assets/images/Michel_avion.jpg' });
}

export {initparallax}
