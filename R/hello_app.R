#' Say hello
#'
#' @param who A valid string.
#'
#' @return A string.
#' @export
#'
#' @examples
#' hello_app()
hello_app <- function() {
  ui <- shiny::fluidPage(
    shiny::selectInput(
      "who",
      "Who would you like to greet?",
      choices = c("world", "tilt"),
      selected = "world"
    ),
    shiny::textOutput("greeting")
  )

  server <- function(input, output, session) {
    output$greeting <- shiny::renderText({
      tiltRequirements::hello(input$who)
    })
  }

  shiny::shinyApp(ui, server)
}
