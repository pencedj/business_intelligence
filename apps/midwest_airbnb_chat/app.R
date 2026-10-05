library(shiny)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client             = client,
  tools              = c("filter", "query", "visualize"),
  greeting           = "Ask me in plain English about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui = page_sidebar(
  title = "Midwest Airbnb Chat",
  theme = bs_theme(
    primary = "#C3142D",
    base_font = font_google("Lato")
  ),
  sidebar = qc$sidebar(width = 350),
  card(
    card_header(textOutput("title")),
    DT::DTOutput("table")
  ),
  accordion(
    open = FALSE,
    accordion_panel("SQL", verbatimTextOutput("sql")),
    accordion_panel(
      "About",
      "This app uses data from Inside Airbnb covering three regions: Chicago (snapshot: July 20, 2026), Columbus (snapshot: July 23, 2026), and the Twin Cities (snapshot: July 21, 2026). Built by Dylan Pence for ISA 401 at Miami University."
    )
  )
)

server = function(input, output, session) {
  vals = qc$server()
  output$title = renderText(vals$title() %||% "All listings")
  output$table = DT::renderDT(
    vals$df(),
    options = list(pageLength = 10)
  )
  output$sql = renderText(
    vals$sql() %||% "SELECT * FROM listings"
  )
}

shinyApp(ui, server)


