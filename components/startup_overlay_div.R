source('components/button_block_box_shadow.R')
startup_overlay_div <- function(overlay_out_time_ms = 500, main_in_time_ms=700){
  
tags$div(id = "startup-overlay",  
         style = ' position: fixed;
    top: 0%; /*110px*/
    left: 0%;
    width: 100%;
    height: 100%;
    color: rgb(30,30,30);
    text-align: center;
    border-radius:20px;

    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 10040;
    background:white;',
  div(
         tags$head(HTML('<style>
         
  .glass-card {
  /* background: rgba(255, 255, 255, 0.44); /* 0.14 */
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border-radius: 20px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  box-shadow: 
    0 8px 32px rgba(0, 0, 0, 0.1),
    inset 0 1px 0 rgba(255, 255, 255, 0.5),
    inset 0 -1px 0 rgba(255, 255, 255, 0.1),
    inset 0 0 10px 5px rgba(255, 255, 255, 0.5);
  overflow: hidden;
}

.glass-card::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(255, 255, 255, 0.8),
    transparent
  );
}

.glass-card::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 1px;
  height: 100%;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0.8),
    transparent,
    rgba(255, 255, 255, 0.3)
  );
}
         
         
/*
 https://blog.hubspot.com/website/css-loading-animation#:~:text=A%20loading%20animation%20is%20a,accepted%20and%20is%20being%20processed.
 */
 .loader-container1 {
  margin-top:30px;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index:1001;
    width:650px;
}


.progress-bar1 {
    width: 70%;
    max-width: 500px;
    height: 15px;
    background-color: white;
    border-radius: 10px;
    border: 1px solid #white;
    overflow: hidden;
    z-index:1001;
    
}

.progress1 {
    width: 0;
    height: 100%;
    background-color: #E01F54;
    /* rgb(122,326,111); */ 
    animation: fill1 2s ease 3s 1 forwards;
    z-index:1001;
}

@keyframes fill1 {
    0% {
        width: 0;
    }
    90% {
        width: 100%;
    }
    100%{
      border-width: 1px;
      border-color:white;
      width: 100%;
    }
    }

         .hello{
  font-weight: bold; /* Makes the text bold */
    font-size: 40px;   
    margin-bottom:10px;
}
</style>')),#'#e01f54aa',

         tags$script(HTML(paste0("
    setTimeout(function() {
      //document.getElementById('startup-overlay').style.display = 'none';
      // document.getElementById('main-content').style.display = 'block';
        $('#startup-overlay').fadeOut(500);

        //$('#main-content').fadeIn('slow');

    }, ",overlay_out_time_ms,");  // 10 seconds = 10000 ms
    //5000
    setTimeout(function() {
      //document.getElementById('startup-overlay').style.display = 'none';
      // document.getElementById('main-content').style.display = 'block';
       // $('#startup-overlay').fadeOut(200);
       
        $('#main-content').fadeIn('slow');

    }, ",main_in_time_ms,");  // 10 seconds = 10000 ms
    //7000
  "))),


style = "
    position: fixed;
    top: 1%; /*110px*/
    left: 1%;
    width: 98%;
    height: 98%;
    background: linear-gradient(45deg, #E01F54 60%, #ff687f 90%);
    color: rgb(30,30,30);
    text-align: center;
    border-radius:20px;

    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 10040;
  ", div(#class  = 'glass-card',
  style = 'overflow:hidden; margin:0px;border-radius:15px;    
    top: 1%; /*110px*/
    left: 1%;
    width: 98%;
    height: 98%;
         display:flex;justify-content:center;align-items:center;flex-direction:column;',
              #    background-color: rgb(122,236,244);

         button_block(border = 'white',
                      div(class = 'hello text-white p-5 rounded-4','Population Health Modelling', 
                          h5(class= 'd-block text-white','Fine Grained Bowel Screening Age Extension Strategy'))
                      ),
         
         #div(style='display:block;position:absolute;justify-content:start;top:50px;left:50px;gap:20px;',
              #img(style= '',src = 'img/pha_logo_0.png', width = '120px;'),
              #p(style='font-size: 11px;','Population Health Model')
         #),
         HTML('<div class="loader-container1">
    <div class="progress-bar1">
        <div class="progress1"></div>
    </div>
</div>' )
              )
         )
)
}

# browsable(page_fluid(theme = bs_theme(version = 5, font_scale = 0.8,
#                                       bootswatch = 'lumen',
#                                       primary = '#2196F3'), startup_overlay_div(50000)))
            
          
          
          
          
          
          
