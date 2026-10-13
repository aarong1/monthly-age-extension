library(echarts4r)

call_recall_gantt <- call_recall_gantt_option1 <- function(height = '300px') {
  blue <- '#5aa0e0'; purple <- '#6a3fd0'; teal <- '#4fa9bc'
  
  # y = row (0 top); x = decimal year
  rows <- list(
    list(y = 60, label = '60 yo before Nov/26', dob = '/1966',
         segs = list(list(as.Date('2025-01-01'), as.Date('2026-11-01'), blue, 'dashed'), 
                     list(as.Date('2026-11-01'), as.Date('2028-11-01'), purple, 'dashed')),
         dots = list(list(as.Date('2026-11-01'), 'hollow', blue), list('2028-11-01', 'filled', purple))
         ),
    list(y = 59, label = '59 yo on or after Nov/26', dob = 'Apr/1968',
         segs = list(list(as.Date('2026-11-01'), as.Date('2027-04-01'), blue, 'solid'), list(as.Date('2028-11-01'), as.Date('2029-04-01'), purple, 'solid')),
         dots = list(list(as.Date('2026-11-01'), 'filled', blue), list(as.Date('2027-04-01'), 'hollow', blue),
                     list(as.Date('2028-11-01'), 'filled', purple), list(as.Date('2029-04-01'), 'hollow', purple))),
    list(y = 58, label = '58 yo on or after Apr/27', dob = 'Apr/1970',
         segs = list(list(as.Date('2027-04-01'), as.Date('2028-04-01'), blue, 'solid'), list(as.Date('2029-04-01'), as.Date('2030-04-01'), purple, 'solid')),
         dots = list(list(as.Date('2027-04-01'), 'filled', blue), list(as.Date('2028-04-01'), 'hollow', blue),
                     list(as.Date('2029-04-01'), 'filled', purple), list(as.Date('2030-04-01'), 'filled', purple))),
    list(y = 57, label = '', dob = '',
         segs = list(list(as.Date('2028-04-01'), as.Date('2030-04-01'), blue, 'dashed'), list(as.Date('2029-04-01'), as.Date('2030-04-01'), purple, 'dashed')),
         dots = list(list(as.Date('2028-04-01'), 'filled', blue), list(as.Date('2029-04-01'), 'filled', purple)))
  )
  
  series <- list()
  for (r in rows) {
    for (s in r$segs) {
      series[[length(series) + 1]] <- list(
        type = 'line', silent = TRUE, symbol = 'none', z = 2,
        data = list(list(s[[1]], r$y), list(s[[2]], r$y)),
        lineStyle = list(color = s[[3]], width = 3, type = s[[4]]))
    }
    series[[length(series) + 1]] <- list(
      name = 'r',
      type = 'scatter', symbolSize = 22, z = 3,
      data = lapply(r$dots, function(d) list(
        value = list(d[[1]], r$y),
        itemStyle = if (d[[2]] == 'hollow')
          list(color = 'white', borderColor = d[[3]], borderWidth = 3)
        else list(color = d[[3]]))))
  }
  
  graphic <- lapply(rows, function(r) list(
    type = 'text', left = 5, top = 78 + r$y * 58,
    style = list(text = paste0(r$label, if (nzchar(r$dob)) paste0('\n', r$dob) else ''),
                 fill = '#777', fontSize = 11)))
  
  e_charts() |>
    e_list(list(
      animation = TRUE,
      grid = list(left = 150, right = 20, top = 40, bottom = 40),
      title = list(
        list(text = 'Call', left = 100, top = 0, textStyle = list(color = blue, fontSize = 16)),
        list(text = 'Recall', left = '85%', top = 0, textStyle = list(color = '#8a63f0', fontSize = 16))),
      graphic = graphic,
      tooltip = list(show = FALSE),
      xAxis = list(type = 'time', min = as.Date('2025-01-01'), max = as.Date('2030-12-01')#,
                   # interval = 'month'#,
                   # axisLabel = list(fontSize = 14, color = '#222', margin = 14),
                   # axisLine = list(lineStyle = list(color = '#888', width = 2)),
                   # axisTick = list(length = 12), splitLine = list(show = FALSE)
                   ),
      yAxis = list(type = 'value', min = 55, max = 61, inverse = F, show = FALSE),
      series = series
    )) |>
    e_charts_height(height) %>% 
    e_tooltip(formatter = JS("  params => {

             const { name, value } = params;
              console.log(params);

            return echarts.format.encodeHTML(name)
             + params.marker 
               + echarts.format.encodeHTML(value[0])
               + '<br>'
                + '<b>' + echarts.format.encodeHTML(value[1]) + ' year olds invited' + '</b>';

        
    }")
    )
}

e_charts_height <- function(widget, height) {
  widget$height <- height
  widget$sizingPolicy$defaultHeight <- height
  widget
}



call_recall_gantt_option2 <- function(height = '300px') {
  #blue <- '#3a74c0'; purple <- '#6a3fd0'; teal <- '#4fa9bc'
  blue <- 'red'; purple <- 'orange'; teal <- '#4fa9bc'
  
  
  # y = row (0 top); x = decimal year
  rows <- list(
    list(y = 0, label = '60 yo before Nov/26', dob = '/1966',
         segs = list(list(as.character(2025), 2027, blue, 'dashed'), list(2027, 2028, purple, 'dashed')),
         dots = list(list(2027, 'hollow', blue), list(2028, 'filled', purple))),
    list(y = 1, label = '59 yo on or after Nov/26', dob = 'Apr/1968',
         segs = list(list(2027, 2028, blue, 'solid'), list(2028, 2029, purple, 'solid')),
         dots = list(list(2027, 'filled', blue), list(2027, 'hollow', blue),
                     list(2028, 'filled', purple), list(2029, 'filled', purple))),
    list(y = 2, label = '58 yo on or after Apr/27', dob = 'Apr/1970',
         segs = list(list(2027, 2027, blue, 'solid'), list(2029, 2030, purple, 'solid')),
         dots = list(list(2027, 'filled', blue), list(2028, 'hollow', blue),
                     list(2029, 'filled', purple), list(2030, 'filled', purple)))#,
    # list(y = 3, label = '', dob = '',
    #      segs = list(list(2027.9, 2029.0, blue, 'dashed'), list(2029.5, 2030.0, purple, 'dashed')),
    #      dots = list(list(2027.9, 'filled', '#5aa0e0'), list(2029.5, 'filled', '#7a60d0')))
  )
  
  series <- list()
  for (r in rows) {
    for (s in r$segs) {
      series[[length(series) + 1]] <- list(
        type = 'line', silent = TRUE, symbol = 'none', z = 2,
        data = list(c(s[[1]], r$y), c(s[[2]], r$y)),
        lineStyle = list(color = s[[3]], width = 3, type = s[[4]]))
    }
    series[[length(series) + 1]] <- list(
      type = 'scatter', symbolSize = 22, z = 3,
      data = lapply(r$dots, function(d) list(
        value = c(d[[1]], r$y),
        itemStyle = if (d[[2]] == 'hollow')
          list(color = 'white', borderColor = d[[3]], borderWidth = 3)
        else list(color = d[[3]]))))
  }
  
  graphic <- lapply(rows, function(r) list(
    type = 'text', left = 5, top = 18 + r$y * 58,
    style = list(text = paste0(r$label, if (nzchar(r$dob)) paste0('\n', r$dob) else ''),
                 fill = '#777', fontSize = 11)))
  
  e_charts() |>
    e_list(list(
      animation = TRUE,
      grid = list(left = 150, right = 20, top = 40, bottom = 40),
      title = list(
        list(text = 'Call', left = 230, top = 0, textStyle = list(color = blue, fontSize = 16)),
        list(text = 'Recall', left = '65%', top = 0, textStyle = list(color = purple, fontSize = 16))),
      graphic = graphic,
      tooltip = list(show = FALSE),
      xAxis = list(type = 'value', min = '2026', max = '2030', interval = 1,
                   axisLabel = list(fontSize = 14, color = '#222', margin = 14),
                   axisLine = list(lineStyle = list(color = '#888', width = 2)),
                   axisTick = list(length = 12), splitLine = list(show = FALSE)),
      yAxis = list(type = 'value', min = -0.5, max = 3.5, inverse = TRUE, show = FALSE),
      series = series
    )) |>
    e_charts_height(height)
}

e_charts_height <- function(widget, height) {
  widget$height <- height
  widget$sizingPolicy$defaultHeight <- height
  widget
}
