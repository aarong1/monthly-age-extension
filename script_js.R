script_js <- tags$head(HTML("<script>

                                            //https://www.youtube.com/watch?v=UqEmFSlx4ps
                                            //https://codepen.io/Coding_Journey/pen/RwGzqgJ
                                            //tilt.js

                                            $(document).ready(function () {
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
                                            });
                                           </script>"))


script_js <- tags$head(
  HTML("
    <script>
      $(document).ready(function () {
        const box = document.getElementById('carouselExample');

        if (!box) return;

        box.style.transformStyle = 'preserve-3d';
        box.style.willChange = 'transform';

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

          // Respond immediately while the mouse is moving.
          box.style.transition = 'none';

          box.style.transform =
            `perspective(1000px)
             rotateX(${tiltX}deg)
             rotateY(${tiltY}deg)
             scale3d(1.05, 1.05, 1.05)`;
        });

        box.addEventListener('mouseleave', function () {
          // Smoothly return to the starting position.
          box.style.transition =
            'transform 500ms cubic-bezier(0.22, 1, 0.36, 1)';

          box.style.transform =
            `perspective(1000px)
             rotateX(0deg)
             rotateY(0deg)
             scale3d(1, 1, 1)`;
        });
      });
    </script>
  ")
)


enable_tilt <- function(id){
script_js <- tags$head(
  HTML(paste0("
    <script>
      $(document).ready(function () {
      
        const box = document.getElementById('",id,"');
        const el = document.getElementById('side_bar');

        if (!box) return;

        el.style.transformStyle = 'preserve-3d';
        el.style.willChange = 'transform';

        box.addEventListener('mousemove', function (e) {
          const bounds = el.getBoundingClientRect();
          const x = e.clientX - bounds.left;
          const y = e.clientY - bounds.top;
          const centerX = bounds.width / 2;
          const centerY = bounds.height / 2;

          const percentX = (x - centerX) / centerX;
          const percentY = (y - centerY) / centerY;

          const maxTiltx = 2;
          const maxTilty = 1;

          const tiltX = -percentY * maxTilty;
          const tiltY = percentX * maxTiltx;

          // Respond immediately while the mouse is moving.
          el.style.transition = 'none';

          el.style.transform =
            `perspective(100px)
             rotateX(${tiltX}deg)
             rotateY(${tiltY}deg)
             scale3d(1.05, 1.05, 1.05)`;
        });

        box.addEventListener('mouseleave', function () {
          // Smoothly return to the starting position.
          el.style.transition =
            'transform 500ms cubic-bezier(0.22, 1, 0.36, 1)';

          el.style.transform =
            `perspective(1000px)
             rotateX(0deg)
             rotateY(0deg)
             scale3d(1, 1, 1)`;
        });
      });
    </script>
  ")
)

)
return(script_js)
}
