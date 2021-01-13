# Server
library(ggplot2)

# Read in our pokemon data set
Names <- read.csv("data/Pokemon.csv")

server <- function(input, output) {
  output$plot <- renderPlot({
    # sort by #
    Names$Name <- factor(Names$Name,levels = Names$Name[order(Names$X.)])
    ggplot(data=Names, aes_string(x='Name', y=input$y_var, fill="Name")) +
      geom_bar(stat="identity", width=0.8)+
      labs(x="Name", y=input$y_var) + coord_flip()
  })
}
