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
                      sticky_side_bar()
                     ),
                     
                     tags$div(class="carousel-item", 
                     sticky_side_bar2()
                     ),
                     
                     # Second slide (with a table)
                     tags$div(class="carousel-item",
                     sticky_side_bar3()
                     ),
                     
                 
         
            ),
            
            # Carousel controls
            tags$button(class="carousel-control-prev ", type="button", `data-bs-target`=paste0("#",id), `data-bs-slide`="prev",
                        #tags$span(class="carousel-control-prev-icon", `aria-hidden`="true"),
                        tags$span(class="visually-hidden", "Previous")
            ),
            tags$button(class="carousel-control-next ", type="button", `data-bs-target`=paste0("#",id), `data-bs-slide`="next",
                        #tags$span(class="carousel-control-next-icon", `aria-hidden`="true"),
                        tags$span(class="visually-hidden", "Next")
            )
   )
}
