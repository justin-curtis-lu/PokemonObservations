#UI

# Read in our pokemon data set ( For drop down selection)
data <- read.csv("data/Pokemon.csv")
selectValues = colnames(data)

# Ignore the # and Name values for select options
selectValues <- selectValues[! selectValues %in% c('X.', 'Name', 'Generation')]


ui <- fluidPage(
  
  includeCSS("css/styles.css"),
  
  column(
    12,
    align = "center",
    offest = 1,
    img(src = "pokemon2.png", height = 400, width = 800 )
  ),

  tabPanel(
    "Visualization",
    titlePanel("What are the Statistics of the starter Pokemon?"),
    p("Select which attribute you would like to see."),
  ),
  
  sidebarPanel(
    selectInput(
      "y_var",
      label = "Attribute",
      choices = selectValues,
      selected = "Attack"
    )
  ),
  
  mainPanel(
    plotOutput("plot")
  )
)