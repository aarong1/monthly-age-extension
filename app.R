#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(shiny)
library(bslib)
library(htmltools)
library(tidyverse)

##############################
 ###### Run before use ######
##############################

# source('./functions/make_bar_plot.R')
# 
# source('./granular_rollout_logic/option1.R')
# source('./granular_rollout_logic/real_option2.R')
# source('./granular_rollout_logic/option3.R')
# 
# source('./granular_rollout_logic/rollout_charts/option1.R')
# source('./granular_rollout_logic/rollout_charts/option2.R')
# source('./granular_rollout_logic/rollout_charts/option3.R')

##############################

# source('components/carousel.R')
source('components/call_recall_gantt.R')
source('components/sticky_side_bar.R')
source('./sticky_side_bar2.R')
source('./sticky_side_bar3.R')
source('components/carousel1.R')
source('components/startup_overlay_div.R')
source('modules/slide_panel_module/slide_panel_module.R')
# source('save_data.R')
source('load_data.R')
load_data()

source('script_js.R')
# Define UI for application that draws a histogram

ui <- page_fluid(theme = bs_theme(bootswatch = 'litera',
                                  primary = 'black',info = 'lightyellow',success = 'lightgreen'),
    
    startup_overlay_div(7000,15000),
    slide_panel_ui('slide' , 'Hello'),
    
    tags$head(
        # Include external dependencies
        # Custom CSS styling
        includeCSS('./www/styles.css'),
        HTML("<link rel='stylesheet' href='progress_bar.css' />"),
        
    ),
    
    # Main layout container
    
    # Control Panel
    div(style = 'font-size:x-small !important;',
    div(class = 'w-100 navbar p-0 fixed-top border-0 d-flex gap-0 flex-column flex-wrap glass-card',
        shiny::tags$nav(
            #style='position:fixed;top:0px;left:0px',
            class = "navbar w-100 glass-card p-3 rounded", # bg-light mt-5
            shiny::h4(  "Population Health", span(class = 'lead','Public Health Agency'),
                        
                        HTML('<h7><span class="badge rounded-pill bg-opacity-75 bg-danger ">Age Extension </span></h7>'),
                        HTML('<h7><span class="badge rounded-pill bg-opacity-75 bg-danger "> Screening</span></h7>'),
                        span(HTML('<h7><span class="badge rounded-pill text-white bg-opacity-75 bg-primary">PHA', '' ,'</span></h7>')),
                        span(HTML('<h7><span class="badge rounded-pill text-white bg-opacity-75 bg-primary">Comissioning ', '' ,'</span></h7>')),
                        span(HTML('<h7><span class="badge rounded-pill text-white bg-opacity-75 bg-primary">Procurement ', '' ,'</span></h7>')),
                        HTML('<h7><span class="badge rounded-pill bg-opacity-75 bg-info ">Population Health Model </span></h7>'),
                        HTML('<h7 id = "move" style = "float:right;">
                       <!-- <a href="https://apply-for-innovation-funding.service.gov.uk/competition/2186/overview/e51c18bc-21b3-450d-bdbc-2f43dad3b268">
                       <span class="badge rounded-pill bg-light">
                        <i class="fa-solid fa-arrow-up-right-from-square"></i>
                       OPIP bid</span>
                       </a> -->
                       </h7>'),
                        class = "navbar-brand mb-0 w-100"
            )
        ),
        # div(class='mt-5 pt-5'),##position:fixed;top:0px;
        HTML('<nav id = "top-top"
                                  style = "width:100%;
                                  margin-inline:-12px;backdrop-filter: blur(5px);
                                  /*background: #00D4FF;
                                  background: linear-gradient(55deg, orange 55%, #FFD700 87%); */
                                  background: linear-gradient(55deg, #E01F54 15%, #ffa2ab 90%);",

                                  class=" w-100 bg-gradient-blue-cyan bg-opacity-50">
                      <div class="text-white">
                      <div id ="top-nav-content" class="d-flex gap-5 justify-content-center align-items-center">
                      <a href="#overview-section" class="nav-item bg-opacity-100 nav-iten p-1 px-4 rounded-pill text-white">
                      <i class="fas fa-tachometer-alt"></i>
                      <span class="fs-6">Overview</span>
                      </a>
          <i class="fa-solid fa-chevron-right"></i>
          <a href="#evidence-section" class="nav-item bg-opacity-100 nav-iten p-1 m-3 px-4 rounded-pill text-white">
          <i class="fas fa-exclamation-triangle"></i>
          <span class="fs-6">Research</span>
          </a>
                      <i class="fa-solid fa-chevron-right"></i>
                      <a href="#prevalence-section" class="nav-item bg-opacity-100 nav-iten p-1 m-3 px-4 rounded-pill text-white">
                      <i class="fas fa-tachometer-alt"></i>
                      <span class="fs-6">Reports</span>
                      </a>
                      <!-- <a href="#incidence-section" class="nav-item bg-opacity-100 nav-iten p-1 px-4 rounded-pill text-white">
                      <i class="fas fa-map-marked-alt"></i>
                      <span class="fs-6">Incidence</span>
                      </a>
                      <a href="#downstream-section" class="nav-item bg-opacity-100 nav-iten p-1 m-3 px-4 rounded-pill text-white">
                      <i class="fas fa-users"></i>
                      <span class="fs-6" > Dashboard</span> -->
                      </a>
                      </div>
                      </div>
                      </nav>')
    )
        
    ),
    tags$head(
        tags$style(HTML(".snap-container {
                        display: flex;
                        flex-wrap: nowrap;
                        flex-direction:row;
                        overflow-x: auto;
                        overflow-y: hidden;
                        scroll-snap-type: x mandatory;
                        scroll-behavior: smooth;
                        -webkit-overflow-scrolling: touch;
                        }
                        
                        .snap-panel {
                        flex: 0 0 100%;
                        scroll-snap-align: start;
                        scroll-snap-stop: always;
                        }
                        
                        .panel-nav { position: fixed; top: 30%; left: 15px; transform: translateY(-50%);
                                     z-index: 1030; display: flex; flex-direction: column; gap: 0px; width: 130px; }
                        .panel-nav-btn { display: flex; align-items: center; justify-content: center; align-content: center; 
                        height: 30px;
                                         border-radius: 5px; color: white; text-decoration: none;
                                         border: 0px solid white; opacity: .7; transition: all .2s; }
                        .panel-nav-btn:hover { opacity: .9; color: white; }
                        .panel-nav-btn.active { border-radius: 10px; opacity: 1; border-width: 5px; }"))
    ),

    # Application title
    # titlePanel("Old Faithful Geyser Data"),
    # script_js ,
    enable_tilt('side_tilt'),
    includeScript(path = './www/js/rotate_card.js') ,
    includeScript(path = './www/js/carousel.js') ,
    
    # Sidebar with a slider input for number of bins 
    
    div(class = 'panel-nav',
        lapply(1:3, function(i) tags$a(href = paste0('#option', i, '-panel'),
                                       style = 'background-color:#E01F54dd;',
                                       class = paste('panel-nav-btn ', if (i == 1) 'active'),
                                       paste('Option', i)))
    ),
    tags$script(HTML("
        document.addEventListener('DOMContentLoaded', function() {
          var btns = document.querySelectorAll('.panel-nav-btn');
          function setActive(id) {
            btns.forEach(function(b) { b.classList.toggle('active', b.getAttribute('href') === '#' + id); });
          }
          btns.forEach(function(b) {
            b.addEventListener('click', function(e) {
              e.preventDefault();
              var id = b.getAttribute('href').slice(1);
              document.getElementById(id).scrollIntoView({behavior: 'smooth', block: 'nearest', inline: 'start'});
              setActive(id);
            });
          });
          var io = new IntersectionObserver(function(entries) {
            entries.forEach(function(en) { if (en.isIntersecting) setActive(en.target.id); });
          }, {root: document.querySelector('.snap-container'), threshold: 0.6});
          document.querySelectorAll('.snap-panel').forEach(function(p) { io.observe(p); });
        });
    ")),
    
    br(),br(),br(),
    
    div(class ='mt-5 pt-5 d-flex align-content-center justify-content-center rounded-5',
        div(class = ' m-5 position-relative rounded-3', style = 'width:65%;padding-left:100px;',
        div(class = 'snap-container w-100 p-5 d-flex flex-row flex-nowrap gap-5 rounded-5',
            style = 'background:white;', #floralwhite
            
                div(class = 'p-3 m-3 position-absolute top-0 end-0',
                # img(src = 'img/scroll.png',height = '50px', style = 'z-index:9999;position:sticky;')
                ),
            div(id = 'option1-panel', class = 'snap-panel position-relative', style = 'display:inline-block;padding:10px;',
                
                        div(class = 'rounded-3 p-2 m-2 bg-info-subtle',
                            h3(class= 'p-3 m-3 text-white rounded-3 bg-primary','59yo in Nov26: 58yo in Apr27 ... to 2030')
                        ),
                
                h4('Gannt Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    # img(src = 'img/option1.png',height = '180px'),
                    div(class ='p-4 m-4 rounded-5 w-75',
                        style = 'background-color:#99e9f211;',
                        
                        call_recall_gantt('300px')
                        )
                ),
                
                h4('Rollout Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    div(class ='p-4 m-4 rounded-5 w-75',
                        style = 'background-color:#99e9f211;',
                        
                      option1_rollout_chart
                        
                    )
                    ),
                
                h4('Eligible Cohort Projected'),
                div(class = 'd-flex flex-row justify-content-around gap-5',
                    div(class ='p-4 m-4 rounded-5 w-75',
                    style = 'background-color:#99e9f211;',

                    option1_chart
                    # chart
                    )
                    ),
                
                div(class = 'alert alert-light',
                    h5('Downstream Demand'),  
                    p(class ='text-muted','Tests')
                    
                ),
                
                div(class = 'd-flex flex-row flex-wrap justify-content-around gap-1' ,
                    div(class = 'w-33 h-25', Return.FIT_demand_option1 %>% e_theme('roma') ),
                    div(class = 'w-33 h-25', Positive.FIT_demand_option1 %>% e_theme('roma') ),
                    div(class = 'w-33 h-25', Spoilt.Result_demand_option1 %>% e_theme('roma') ),
                    div(class = 'w-33 h-25', Replacement_demand_option1 %>% e_theme('roma') ),
                    div(class = 'w-33 h-25', surv.needed__option1 %>% e_theme('roma') ),
                    div(class = 'w-33 h-25', Attend.SSP_demand_option1 %>% e_theme('roma') ),
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon')
                        
                    ),
                    div(class = 'w-33 h-25',Index.colon_demand_option1),
                    div(class = 'w-33 h-25',Surveillance.colon_demand_option1),
                    div(class = 'w-33 h-25',Repeat.colon_demand_option1),
                    div(class = 'w-33 h-25',colon_all_demand_option1),
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT')
                        
                    ),
                    div(class = 'w-33 h-25',Index.CT.colon_demand_option1),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_demand_option1),
                    div(class = 'w-33 h-25',Repeat.CT.colon_demand_option1),
                    div(class = 'w-33 h-25',CT.colon_all_demand_option1),
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Flexi Sig')
                        
                    ),
                    div(class = 'w-33 h-25',Index.Flexi.Sig.colon_demand_option1),
                    div(class = 'w-33 h-25',Surveillance.Flexi.sig.colon_demand_option1),
                    div(class = 'w-33 h-25',Repeat.Flexi.Sig.colon_demand_option1),
                    div(class = 'w-33 h-25',Flexi.Sig.colon_all_demand_option1),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT using average for the last 3 years results')
                        
                    ),
                    div(class = 'w-33 h-25',Index.CT.colon_avg_demand_option1),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_avg_demand_option1),
                    div(class = 'w-33 h-25',Repeat.CT.colon_avg_demand_option1),
                    div(class = 'w-33 h-25',CT.colon_all_avg_demand_option1)
                )
                
            ),
            
            div(id = 'option2-panel', class = 'snap-panel', style = 'display:inline-block;',
                div(class = 'rounded-3 p-2 m-2 bg-info-subtle',
                    h3(class= 'p-3 m-3 text-white rounded-3 bg-primary','59yo in Nov26: 58yo in Nov27')
                ),
                
                h4('Gannt Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    # img(src = 'img/option1.png',height = '180px'),
                    div(style = 'width:60%;', 
                        # call_recall_gantt('300px')
                    )
                ),
                
                h4('Rollout Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    div(class= 'w-100 h-100 p-5 m-5',
                        option2_rollout_chart
                        
                    )
                ),
                
                h4('Eligible Cohort Projected'),
                div(class = 'd-flex flex-row justify-content-around gap-5',
                    div(class ='p-4 m-4 rounded-4 w-100',
                        style = 'background-color:#99e9f211;',
                        
                        option2_chart
                        # chart
                    )
                ),
                
                div(class = 'alert alert-light',
                    h5('Downstream Demand'),  
                    p(class ='text-muted','Tests')
                    
                ),

                div(class = 'd-flex flex-row flex-wrap' ,
                    div(class = 'w-25',style = 'height:200px', Return.FIT_demand_option2),
                    div(class = 'w-33 h-25', Positive.FIT_demand_option2),
                    div(class = 'w-33 h-25', Spoilt.Result_demand_option2),
                    div(class = 'w-33 h-25', Replacement_demand_option2),
                    div(class = 'w-33 h-25', Attend.SSP_demand_option2),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon')
                    ),
                    
                    div(class = 'w-33 h-25', surv.needed__option2),
                    div(class = 'w-33 h-25',Index.colon_demand_option2),
                    div(class = 'w-33 h-25',Surveillance.colon_demand_option2),
                    div(class = 'w-33 h-25',Repeat.colon_demand_option2),
                    div(class = 'w-33 h-25',colon_all_demand_option2),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT')
                        
                    ),
                    
                    div(class = 'w-33 h-25',Index.CT.colon_demand_option2),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_demand_option2),
                    div(class = 'w-33 h-25',Repeat.CT.colon_demand_option2),
                    div(class = 'w-33 h-25',CT.colon_all_demand_option2),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Flexi Sig')
                        
                    ),
                    
                    div(class = 'w-33 h-25',Index.Flexi.Sig.colon_demand_option2),
                    div(class = 'w-33 h-25',Surveillance.Flexi.sig.colon_demand_option2),
                    div(class = 'w-33 h-25',Repeat.Flexi.Sig.colon_demand_option2),
                    div(class = 'w-33 h-25',Flexi.Sig.colon_all_demand_option2),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT using average for the last 3 years results')
                        
                    ),
                    
                    div(class = 'w-33 h-25',Index.CT.colon_avg_demand_option2),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_avg_demand_option2),
                    div(class = 'w-33 h-25',Repeat.CT.colon_avg_demand_option2),
                    div(class = 'w-33 h-25',CT.colon_all_avg_demand_option2)
                )

            ),
            
            div(id = 'option3-panel', class = 'snap-panel',
                div(class = 'rounded-3 p-2 m-2 bg-info-subtle',
                    h3(class= 'p-3 m-3 text-white rounded-3 bg-primary','59yo in Apr27: 58yo in Apr27')
                ),
                
                h4('Gannt Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    # img(src = 'img/option1.png',height = '180px'),
                    div(style = 'width:60%;', 
                        # call_recall_gantt('300px')
                    )
                ),
                
                h4('Rollout Chart'),
                div(class = 'd-flex flex-row justify-content-around',
                    div(class= 'w-75 h-100 p-5 m-5',
                        option3_rollout_chart
                        
                    )
                ),
                
                h4('Eligible Cohort Projected'),
                div(class = 'd-flex flex-row justify-content-around gap-5',
                    div(class ='p-4 m-4 rounded-4 w-75',
                        style = 'background-color:#e7dbc322;',
                        
                        option3_chart
                        # chart
                    )
                ),
                
                div(class = 'alert alert-light',
                    h5('Downstream Demand'),  
                    p(class ='text-muted','Tests')
                    
                ),

                div(class = 'd-flex flex-row flex-wrap' ,
                    div(class = 'w-33 h-25', Return.FIT_demand_option3),
                    div(class = 'w-33 h-25', Positive.FIT_demand_option3),
                    div(class = 'w-33 h-25', Spoilt.Result_demand_option3),
                    div(class = 'w-33 h-25', Replacement_demand_option3),
                    div(class = 'w-33 h-25', Attend.SSP_demand_option3),
                    
                    div(class = 'alert w-100 alert-warning',
                        h5('Lab'),
                        h5(class ='text-muted','Colon')
                    ),
                    
                    div(class = 'w-33 h-25', surv.needed__option3),
                    div(class = 'w-33 h-25',Index.colon_demand_option3),
                    div(class = 'w-33 h-25',Surveillance.colon_demand_option3),
                    div(class = 'w-33 h-25',Repeat.colon_demand_option3),
                    div(class = 'w-33 h-25',colon_all_demand_option3),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT')
                        
                    ),
                    
                    div(class = 'w-33 h-25',Index.CT.colon_demand_option3),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_demand_option3),
                    div(class = 'w-33 h-25',Repeat.CT.colon_demand_option3),
                    div(class = 'w-33 h-25',CT.colon_all_demand_option3),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Flexi Sig')
                        
                    ),
                    
                    
                    div(class = 'w-33 h-25',Index.Flexi.Sig.colon_demand_option3),
                    div(class = 'w-33 h-25',Surveillance.Flexi.sig.colon_demand_option3),
                    div(class = 'w-33 h-25',Repeat.Flexi.Sig.colon_demand_option3),
                    div(class = 'w-33 h-25',Flexi.Sig.colon_all_demand_option3),
                    
                    div(class = 'alert w-100 alert-warning-subtle',
                        h5('Lab'),
                        h5(class ='text-muted','Colon CT using average for the last 3 years results')
                        
                    ),
                    
                    div(class = 'w-33 h-25',Index.CT.colon_avg_demand_option3),
                    div(class = 'w-33 h-25',Surveillance.CT.colon_avg_demand_option3),
                    div(class = 'w-33 h-25',Repeat.CT.colon_avg_demand_option3),
                    div(class = 'w-33 h-25',CT.colon_all_avg_demand_option3)
                )
            )
        ),
        div(class = 'glass-card position-absolute top-0 end-0 h-100',
            style = 'width:60px; pointer-events:none; z-index:2;border-radius: 0em 1em 1em 0em;backdrop-filter:blur(1px) !important;')
        ),
        #     div(class ='w-50',
        #     ),
        div(id = 'side_tilt',
            style = 'height:80vh;width:300px;position:sticky;top:160px;right:0px;',
        carousel('carouselExample'),
           # sticky_side_bar()
      )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    slide_panel_server(id = 'slide' )
    
    
    # output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #     
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white',
    #          xlab = 'Waiting time to next eruption (in mins)',
    #          main = 'Histogram of waiting times')
    # })
}

# Run the application 
shinyApp(ui = ui, server = server)
