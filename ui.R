#UI

# Read in our pokemon data set
data <- read.csv("data/Pokemon.csv")
select_values = colnames(data)

# Ignore the # and Name values for select options
select_values <- select_values[! select_values %in% c('X.', 'Name')]


ui <- fluidPage(
  img(src = "pokemon.png", height = 400, width = 800, ),
  br(), br(),
  tabPanel(
    "Visualization",
    titlePanel("What are the Characteristics of the starter Pokemon?"),
    p("Use the selector input below to choose which variable you would like to see."),
  ),
  sidebarPanel(
    selectInput(
      "y_var",
      label = "Y Variable",
      choices = select_values,
      selected = "Speed"
    )
  ),
  mainPanel(
    plotOutput("plot")
  ),
)