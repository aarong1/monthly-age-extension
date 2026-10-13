sticky_side_bar <- function() {
  div(id = 'side_bar',style = 'position:sticky; top:0%; padding-top:30% height:auto;',
      div(class = 'py-2 px-5 me-3 mt-5 rounded-5 position-relative',
          
          span(class="badge bg-danger rounded-2 rounded-pill",
               style="top:-15px; left:10px; position:absolute;",
               h6(style="text-align:center;color:white;", 'Option 1 executive Summary')
          ),
          
          div(class = '',
              # 'alert alert-success',
              style = "background-color:#f5e8c8; justify-content:center;border-radius:25px;display:flex;flex-direction:column;align-items:center;width:120px;height:100px;margin:20px auto;",
              tags$div(class='mb-1 text-white text-center','Rollout'),
              h3(textOutput('side_emergency_admissions') ),
              tags$small(class = 'text-centre text-center','Complete rollout to 50yo in 2030 '),
              # tags$h4(class = 'mt-3 text-white text-centre text-center','by intervention end')
          ),
          
          div(
            style = "background:white;border:5px solid #e01f54;justify-content:center;border-radius:25px;display:flex;flex-direction:column;align-items:center;width:120px;height:auto;padding:5px;margin:20px auto;",
            tags$small(class='fw-lighter', '59yo in Nov 2026'),
            tags$small(class='fw-light','58yo in Apr 2027'),
            tags$small(class='text-center fw-medium','57yo in Apr 2028',
                                           '56yo in Apr 2028'),
            tags$small(class='fw-semibold',  '55yo in Apr 2029'),
            tags$small(class='fw-semibold',  '54yo in Apr 2029'),
            tags$small(class='fw-semibold',  '53yo in Apr 2029'),
            tags$small(class='fw-bolder',      '52yo in Apr 2030'),
            tags$small(class='fw-bolder',      '51yo in Apr 2030'),
            tags$small(class='fw-bolder',      '50yo in Apr 2030'),
            br(),
            tags$div(class ='fw-light', ' Definition'),
            # tags$small(class='text-muted text-black text-center','Pre-planning Pipeline'),
            # tags$div(class='h3 text-black text-centre text-center','updated from estimate')
          ),
          
          div(
            style = "background:white;border:5px solid #e01f54;justify-content:center;border-radius:25px;display:flex;flex-direction:column;align-items:center;width:120px;height:100px;margin:10px auto;",
            tags$small(class='text-center fw-bold', 'Downstream Demand'),
            h3(''),
            tags$small(class='text-muted text-centre text-center',' by HSCT')
          ),
          
          
          
          div(class = 'shadow-sm',
              style = "background:white;border:5px solid #001852;justify-content:center;border-radius:25px;display:flex;flex-direction:column;align-items:center;width:120px;height:100px;margin:20px auto;",
              tags$small(class='text-muted', 'First Year New Cases'),
              h4( ''),
              tags$small(class='text-muted text-centre text-center','')
          ),
          
          # div(class = 'alert bg-info',  h6('DALYS'), h4('456,454') ),
          # div(class = 'alert bg-primary',  h6('DALYS'), h4('456,454') ),
          # circular_value('45,324')
      )
  )
}
