x <- "The Man with the Golden Gun was written by Ian Fleming (pictured) and is the final novel in the James Bond series. It was published by Jonathan Cape in the United Kingdom on 1 April 1965, eight months after the author's death. The story centres on the fictional British Secret Service operative James Bond, who returns to Britain via the Soviet Union, where he had been brainwashed. After being de-programmed, Bond goes to the Caribbean to kill Francisco Scaramanga, the titular The first draft and part of the editing process were completed before Fleming's death; the level of detail from previous novels was missing, as this was often added by Fleming in the second draft. The novel was serialised in 1965 and a daily comic strip adaptation was published the following year. In 1974, the book was adapted as the ninth film in Eon Productions' James Bond series. (This article is part of a featured topic: Ian Fleming's James Bond novels and short"
carousel <- function(id = NULL){

if (!is.character(id)) {
    stop("Error: 'id' argument cannot be NULL and must be a character.")
}
  
  tags$div(id=id, class="carousel slide m-5", style = 'padding:10px;height:100%;', 

    # Indicators for slides
    tags$div(class="carousel-indicators",
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="0", class="active", `aria-current`="true", `aria-label`="Slide 1"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="1", `aria-label`="Slide 2"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="2", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="3", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="4", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="5", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="6", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="7", `aria-label`="Slide 3"),
      tags$button(type = "button", `data-bs-target`=paste0("#",id), `data-bs-slide-to`="8", `aria-label`="Slide 3"),


    ),
    
    # Carousel items (add custom content here)
    tags$div(class="carousel-inner",class='h-100 p-30',
      
      # First slide (with text content)
      tags$div(class="carousel-item active", 
        tags$div(class="d-block w-100 text-white p-3",style="height: 420px;background-color:royalblue;border:solid white 1px;border-radius:10px;",
          tags$h5("Demographics"),
          
          x
          )
      ),
      
      tags$div(class="carousel-item", 
        tags$div(class="d-block w-100 text-white p-3",style="height: 420px;background-color:floralwhite;border:solid white 1px;border-radius:10px;",
          tags$h5("Demographics"),
          # tags$h5('Inequality'),
          # 
          # tags$p("Both deprivation and gender are the most considered measures of inequality.
          #        Regional inequality is not considered, only in the sense that a regional is considered as characterised exclusively as a function of its demographic make up.
          #        It is in this context that spatial delineation of results are prepared."),
          # tags$h5('Source'),
          # tags$a(href='https://connect.strategyunitwm.nhs.uk/content/b05b649b-511d-4921-9069-2a7a62d694dd/',
          #        "NHS Strategy Unit"),
          
          x

          )
      ),
      
      # Second slide (with a table)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height:420px;background-color:lightgreen;border:solid white 1px;border-radius:10px;",
          tags$h5("Behavioural factors"),
          tags$h5("BMI"),
         tags$p("This is binary categorised as at-elevated risk and below elevated-risk either side of a measurement of 25 Kgm-2. Underweight conditions are not considered.
                As diet and alcohol are not considered explicitly, possible scenarios targeting BMI include these
                interventions, mimicking gender differences and deprivation inequality in prevalence. 
                Additionally, weight loss pharmeceuticals are also topical."),
         tags$a(href = 'https://www.health-ni.gov.uk/news/health-survey-ni-first-results-201920',
                "DoH Health Survey"),
       
      )
      ),
      
       # Second slide (with a table)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height:420px;background-color:lightgreen;border:solid white 1px;border-radius:10px;",
          tags$h5("Behavioural factors"),
         tags$a(href = 'https://www.health-ni.gov.uk/news/health-survey-ni-first-results-201920',
                "DoH Health Survey"),
         tags$h5("Smoking"),
         tags$p("Smokers are similarly bagged into smoking and non smoking.
                An additional state 'used to smoke' represents the dimished, but not vanishing risk, to cardiovascular complication.
                Possible interventions are smoking cessation programmes with particular focus on elevated prevalence among deprived areas, 
                regression and programme adherence, and extending to consider vaping")

        )
      ),
      
       # Third slide (with a plot)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height: 420px; background-color:orange;border:solid white 1px;border-radius:10px;",
          tags$h5("Physiological"),
         
         tags$p('Physiological risk factors are strongly demographic and risk factor dependent.
                Data is less regularly captured and while some have associated mortality they are not always
                the reason for primary care contact and as such are not recorded accurately. As opposed to the survey data for behavioural risk factors then
                additional considerations are that ')
        )
      ),
      
      # Third slide (with a plot)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height: 420px; background-color:orange;border:solid white 1px;border-radius:10px;",
          tags$h5("Physiological"),
         tags$h5("Diabetes,type 2"),
         tags$p('Diabetes type 2')
        )
      ),
      
       # Third slide (with a plot)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height: 420px; background-color:orange;border:solid white 1px;border-radius:10px;",
          tags$h5("Physiological"),
         tags$h5("Hypertension"),
         tags$p("")
        )
      ),
      
       # Third slide (with a plot)
      tags$div(class="carousel-item",
        tags$div(class="d-block w-100 text-white p-3", style="height: 420px; background-color:orange;border:solid white 1px;border-radius:10px;",
          tags$h5("Physiological"),
         tags$h5("Cholesterol"),
         tags$p('Cholesterol is a risk factor for various serious CVD. Here it largely refers to the ')
        )
      )
    ),
    
    # Carousel controls
    tags$button(class="carousel-control-prev", type="button", `data-bs-target`=paste0("#",id), `data-bs-slide`="prev",
      #tags$span(class="carousel-control-prev-icon", `aria-hidden`="true"),
      tags$span(class="visually-hidden", "Previous")
    ),
    tags$button(class="carousel-control-next", type="button", `data-bs-target`=paste0("#",id), `data-bs-slide`="next",
      #tags$span(class="carousel-control-next-icon", `aria-hidden`="true"),
      tags$span(class="visually-hidden", "Next")
    )
  )
  }
