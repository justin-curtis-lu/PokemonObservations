#UI

# Read in our pokemon data set ( For drop down selection)
data <- read.csv("data/Pokemon.csv")
selectValues = colnames(data)

# Ignore the # and Name values for select options
selectValues <- selectValues[! selectValues %in% c('X.', 'Name', 'Generation')]

ui <- fluidPage(
  column(
    12,
    align = "center",
    offest = 1,
    img(src = "pokemon2.png", height = 400, width = 800 )
  ),

  tabPanel(
    "Visualization",
    titlePanel("What are the Statistics of the starter Pokemon?"),
    p("Select which attribute to plot."),
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
  ),
  
  tabPanel(
    "Visualization",
    titlePanel("Starter Pokemon Appearance"),
    p("Select an indivual Pokemon you would like to view"),
  ),

  sidebarPanel(
    selectInput("Pokemon", "Choose a Pokemon:",
        list(`Generation1` = list('Bulbasaur',
                                  'Charmander',
                                  'Squirtle',
                                  'Pikachu',
                                  'Eevee'),
             `Generation2` = list('Chikorita',
                                  'Cyndaquil',
                                  'Totodile'),
             `Generation3` = list('Treecko',
                                  'Torchic',
                                  'Mudkip'),
             `Generation4` = list('Turtwig',
                                  'Chimchar',
                                  'Piplup'),
             `Generation5` = list('Snivy',
                                  'Tepig',
                                  'Oshawott'),
             `Generation6` = list('Chespin',
                                  'Fennekin',
                                  'Froakie')
          )
      )
  ),

  mainPanel(
    fluidRow(
      column(
        7,
        align = "right",
        plotOutput("Image")
        
      )
    )
  )
)