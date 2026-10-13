  document.addEventListener('DOMContentLoaded', function () {

const box = document.getElementById('carouselExample');

box.addEventListener('mousemove', function (e) {
  const bounds = box.getBoundingClientRect();
  const x = e.clientX - bounds.left;
  const y = e.clientY - bounds.top;
  const centerX = bounds.width / 2;
  const centerY = bounds.height / 2;
  
  const percentX = (x - centerX) / centerX;
  const percentY = (y - centerY) / centerY;
  
  const maxTilt = 10;
  const tiltX = -percentY * maxTilt;
  const tiltY = percentX * maxTilt;
  
  box.style.transform = `perspective(1000px) rotateX(${tiltX}deg) rotateY(${tiltY}deg) scale3d(1.05, 1.05, 1.05)`;
});

box.addEventListener('mouseleave', function () {
  box.style.transform = `rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)`;
});

box.addEventListener('mouseenter', function () {
  box.style.transition = 'transform 0.3s ease';
});

});