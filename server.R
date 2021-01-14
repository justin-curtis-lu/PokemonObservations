# Server
library(ggplot2)

# Read in our pokemon data set
Names <- read.csv("data/Pokemon.csv")

server <- function(input, output) {
  
  output$plot <- renderPlot({
    # sort by #
    Names$Name <- factor(Names$Name,levels = Names$Name[order(Names$X.)])
    
    # Create plot with all starter Pokemon
    ggplot(data=Names, aes_string(x='Name', y=input$y_var, fill="Generation")) + 
    geom_bar(stat="identity", width=.9) + 
    labs(x="Name", y=input$y_var) + 
    coord_flip() 
  })
  
  output$Image <- renderImage({
    filename <- normalizePath(file.path('./www',
                                        paste(input$Pokemon, '.png', sep='')))
    list(src = filename, width = 400,
         height = 300)
  }, deleteFile = FALSE)
}
    

